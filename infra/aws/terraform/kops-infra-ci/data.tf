/*
Copyright 2023 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

data "aws_availability_zones" "available" {
  provider = aws.kops-infra-ci
  state    = "available"
}

data "aws_caller_identity" "current" {
  provider = aws.kops-infra-ci
}

data "aws_region" "current" {
  provider = aws.kops-infra-ci
}

data "aws_organizations_organization" "current" {}

data "aws_iam_roles" "sso_admins" {
  name_regex  = "AWSReservedSSO_AdministratorAccess_.*"
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

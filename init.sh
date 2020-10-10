#!/bin/bash
# 1. 安装docker

echo -e "\033[42;34m----------安装docker---------- \033[0m"

## 更新yum源

yum -y update

echo -e "\033[42;34m 更新yum源完成 \033[0m"

## 移除旧版本

yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

echo -e "\033[42;34m 移除旧版本docker完成 \033[0m"

## 设置仓库

sudo yum install -y yum-utils

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## 安装 docker

yum install -y docker-ce docker-ce-cli containerd.io

## 启动并设置为开机启动

systemctl start docker

systemctl enable docker

echo -e "\033[42;34m docker安装完成 \033[0m"

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version

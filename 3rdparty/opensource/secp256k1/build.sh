#!/bin/bash

source param.mk

CURDIR=`pwd`



if [ -d ${DIRNAME} ]; then
    rm -rf ${DIRNAME}
fi

if [ -d ${INSTALLDIR} ]; then
    rm -rf ${INSTALLDIR}
fi

mkdir ${INSTALLDIR}

git clone ${DOWNLOADURL}

# build lib
cd ${DIRNAME}
./autogen.sh
./configure --prefix=${CURDIR}/${INSTALLDIR} --disable-shared --enable-static
make
make install
cd ..

# copy libs and include
cp -rf ${INSTALLDIR}/lib/ ${CURDIR}/../../prebuild/secp256k1
#cp -rf ${INSTALLDIR}/include/ ${CURDIR}/../../prebuild/secp256k1
cp -rf ${DIRNAME}/include/ ${CURDIR}/../../prebuild/secp256k1
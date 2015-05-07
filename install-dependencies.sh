#!/bin/bash

function install_cmake()
{
	tar zxvf cmake-3.2.1.tar.gz && cd cmake-3.2.1;

	if [ $# == 1 ]
		then
			echo "install cmake in $1";
			./configure --prefix=$1;
		elif [ $# == 0 ]
		then
			echo "install cmake in default path";
			./configure;
		else
			echo "wrong commands";
	fi

	gmake && gmake install
	PATH=$1/bin:$PATH;
	echo $PATH;
	export PATH=$1/bin:$PATH;
	cd ..;
	echo "cmake is done";
}

function install_czmq()
{
	tar zxvf czmq-3.0.0-rc1.tar.gz && cd czmq-3.0.0;
	
	if [ $# == 2 ]
		then
			echo "install czmq in $1 and libzmq path is $2";
			./configure --prefix=$1 --with-libzmq=$2;
		elif [ $# == 1 ]
		then
			echo "install czmq in $1 and libzmq path is default";
			./configure --prefix=$1;
		elif [ $# == 0 ]
		then
			echo "install czmq in default path";
			./configure;
		else
			echo "wrong commands";
	fi

	make && make install;
	cd ..;
	echo "czmq is done";
}

function install_gflags()
{
	tar zxvf gflags-2.1.1.tar.gz && cd gflags-2.1.1;
	mkdir build && cd build;

	if [ $# == 1 ]
		then
			echo "install gflags in $1"
			cmake .. -DCMAKE_INSTALL_PREFIX=$1;
		elif [ $# == 0 ]
		then 
			echo "install gflags in default path";
			cmake ..;
		else
			echo "gflags is done";
	fi
	
	make && make install;
	cd ../..;
	echo "gflags is done";
}

function install_glog()
{
	tar zxvf glog-0.3.3.tar.gz && cd glog-0.3.3;

	if [ $# == 1 ]
		then
			echo "install glog in $1";
			./configure --prefix=$1;
		elif [ $# == 0 ]
		then
			echo "install glog in default path";
			./configure;
		else
			echo "wrong commands";
	fi

	make && make install;
	cd ..;
	echo "glog is done";
}

function install_lmdb()
{
	tar zxvf lmdb-0.9.10.tar.gz && cd mdb-mdb/libraries/liblmdb;

	if [ $# == 1 ]
		then
			echo "install lmdb in $1";
			sed -i "26s#^.*#prefix=$1#g" Makefile;
		elif [ $# == 0 ]
		then
			echo "install lmdb in default path";
		else
			echo "wrong commands";
	fi

	make && make install;
	cd ../../..;
	echo "lmdb is done";
}

function install_openblas()
{
	unzip OpenBLAS.zip && cd OpenBLAS-develop;

	make;
	if [ $# == 1 ]
		then
			echo "install OpenBLAS in $1";
			make PREFIX=$1 install;
		elif [ $# == 0 ]
		then
			echo "install cmake in default path";
			make install;
		else
			echo "wrong commands";
	fi
	cd ..;
	echo "OpenBLAS is done";
}

function install_opencv()
{
	unzip opencv-2.4.10.zip && cd opencv-2.4.10;
	
	if [ $# == 1 ]
		then
			echo "install opencv in $1";
			cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$1;
		elif [ $# == 0 ]
		then
			echo "install opencv in default path";
			cmake -DCMAKE_BUILD_TYPE=RELEASE;
		else
			echo "wrong commands";
	fi

	make && make install;
	cd ..;	
	echo "opencv is done";
}

function install_protobuf()
{
	tar zxvf protobuf-2.6.0.tar.gz && cd protobuf-2.6.0;

	if [ $# == 1 ]
		then
			echo "install protobuf in $1";
			./configure --prefix=$1;
		elif [ $# == 0 ]
		then
			echo "install protobuf in default path";
			./configure;
		else
			echo "wrong commands";
	fi

	make && make install;
	cd ..;
	echo "protobuf is done";
}

function install_zeromq()
{
	tar zxvf zeromq-3.2.2.tar.gz && cd zeromq-3.2.2;

	if [ $# == 1 ]
		then
			echo "install zeromq in $1";
			./configure --prefix=$1;
		elif [ $# == 0 ]
		then
			echo "install zeromq in default path";
			./configure;
		else
			echo "wrong commands";
	fi
	
	make && make install
	cd ..;
	echo "zeromq is done";
}

while [ $# != 0 ]
do
	case $1 in
	"cmake")
		echo "install cmake";
		if [[ $2 == */* ]];then
			install_cmake $2;
			shift
			shift
		else
			install_cmake;
			shift
		fi
		;;
	"czmq")
		echo "install czmq";
		if [[ $2 == */* ]];then
			if [[ $3 == */* ]];then
				install_czmq $2 $3;
				shift
				shift
				shift
			else
				install_czmq $2;
				shift
				shift
			fi
		else
			install_czmq;
			shift
		fi
		;;
	"gflags")
		echo "install gflags";
		if [[ $2 == */* ]];then
			install_gflags $2;
			shift
			shift
		else
			install_gflags;
			shift
		fi
		;;
	"glog")
		echo "install glog";
		if [[ $2 == */* ]];then
			install_glog $2;
			shift
			shift
		else
			install_glog;
			shift
		fi
		;;
	"lmdb")
		echo "install lmdb";
		if [[ $2 == */* ]];then
			install_lmdb $2;
			shift
			shift
		else
			install_lmdb;
			shift
		fi
		;;
	"OpenBLAS")
		echo "install OpenBLAS";
		if [[ $2 == */* ]];then
			install_openblas $2;
			shift
			shift
		else
			install_openblas;
			shift
		fi
		;;
	"opencv")
		echo "install opencv";
		if [[ $2 == */* ]];then
			install_opencv $2;
			shift
			shift
		else
			install_opencv;
			shift
		fi
		;;
	 "protobuf")
		echo "install protobuf";
		if [[ $2 == */* ]];then
			install_protobuf $2;
			shift
			shift
		else
			install_protobuf;
			shift
		fi
		;;
	"zeromq")
		echo "install zeromq";
		if [[ $2 == */* ]];then
			install_zeromq $2;
			shift
			shift
		else
			install_zeromq;
			shift
		fi
		;;
	"all")
		echo "install all dependencies";
		if [[ $2 == */* ]];then
			install_cmake $2;
			install_zeromq $2;
			install_czmq $2 $2;
			install_gflags $2;
			install_glog $2;
			install_lmdb $2;
			install_openblas $2;
			install_opencv $2;
			install_protobuf $2;
			shift
			shift
		else
			install_cmake;
			install_zeromq;
			install_czmq;
			install_gflags;
			install_glog;
			install_lmdb;
			install_openblas;
			install_opencv;
			install_protobuf;
			shift
		fi
		;;
	*)
		echo "INVALID ARGUMENTS"
	esac	
done

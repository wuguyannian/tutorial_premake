workspace "Tutorial" -- 解决方案
    startproject "Tutorial" -- 开始项目

    configurations
    {
        "Debug",
        "Release"
    }

    platforms
    {
        "Win32",
        "Win64"
    }

    filter "platforms:Win32"
        system "Windows"
        architecture "x32"

    filter "platforms:Win64"
        system "Windows"
        architecture "x86_64"

outputdir = "%{cfg.platform}%{cfg.buildcfg}/%{prj.name}"

project "LibUtial"
    location "LibUtial"
    kind "StaticLib"    -- 静态库
    language "C++"

    targetdir ("../bin/" .. outputdir)
	objdir ("../bin_obj/" .. outputdir)

    files
    {
        "%{prj.name}/**.h",       -- 当前文件夹所有.h文件
        "%{prj.name}/**.cpp"      -- 当前文件夹所有.cpp文件
    }

project "Tutorial"      -- 项目
    location "Tutorial"
    links "LibUtial"
    kind "ConsoleApp"   -- 控制台应用
    language "C++"

    targetdir ("../bin/" .. outputdir)
    objdir ("../bin_obj/" .. outputdir)

    includedirs
    {
        "LibUtial"
    }

    files
    {
        "%{prj.name}/**.cpp"      -- 当前文件夹所有.cpp文件
    }


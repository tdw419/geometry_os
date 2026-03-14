from setuptools import setup, find_namespace_packages

setup(
    name="cli-anything-geos",
    version="1.0.0",
    packages=find_namespace_packages(include=["cli_anything.*"]),
    install_requires=[
        "click>=8.0.0",
        "prompt-toolkit>=3.0.0",
        "serde>=0.1.0",
    ],
    entry_points={
        "console_scripts": [
            "cli-anything-geos=cli_anything.geos.geos_cli:main",
        ],
    },
    python_requires=">=3.10",
)

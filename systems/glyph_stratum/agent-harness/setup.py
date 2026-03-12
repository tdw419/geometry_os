#!/usr/bin/env python3
"""Setup for GlyphStratum CLI package."""
from setuptools import setup, find_namespace_packages

setup(
    name="cli-anything-glyph-stratum",
    version="0.1.0",
    description="GlyphStratum - AI-native visual programming language CLI",
    author="Geometry OS",
    author_email="",
    url="https://github.com/geometry-os/geometry-os",
    packages=find_namespace_packages(include=["cli_anything.*"]),
    install_requires=[
        "click>=8.0",
        "prompt_toolkit>=3.0",
    ],
    entry_points={
        "console_scripts": [
            "glyphctl=cli_anything.glyph_stratum.glyph_stratum_cli:cli",
        ],
    },
    python_requires=">=3.10",
)

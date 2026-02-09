#!/usr/bin/env python3
"""Tests for vasm linter"""
import pytest
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from linter import LinterError, lint_source


def test_valid_source_passes():
    """Test that valid assembly passes linting"""
    source = """
LOAD R0, 42
ADD R0, 1
RET R0
"""
    errors = lint_source(source)
    assert errors == []


def test_undefined_label_fails():
    """Test that undefined label is caught"""
    source = """
LOAD R0, 42
JMP undefined_label
RET R0
"""
    errors = lint_source(source)
    assert len(errors) > 0
    assert any('undefined_label' in str(e).lower() for e in errors)


def test_unused_register_warning():
    """Test that unused registers are warned"""
    source = """
LOAD R0, 42
LOAD R1, 100
RET R0
"""
    errors = lint_source(source)
    # R1 is loaded but never used
    assert len(errors) > 0


def test_invalid_register_fails():
    """Test that invalid register is caught"""
    source = """
LOAD R999, 42
RET R999
"""
    errors = lint_source(source)
    assert len(errors) > 0
    assert any('register' in str(e).lower() for e in errors)

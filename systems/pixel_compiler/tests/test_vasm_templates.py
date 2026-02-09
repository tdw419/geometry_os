#!/usr/bin/env python3
"""Tests for vasm template system"""
import pytest
import sys
import tempfile
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from vasm import list_templates, load_template


def test_list_templates_returns_list():
    """Test that list_templates returns available templates"""
    templates = list_templates()
    assert isinstance(templates, list)
    assert len(templates) > 0
    assert all(isinstance(t, str) for t in templates)


def test_load_template_fibonacci():
    """Test loading fibonacci template"""
    source = load_template('fibonacci')
    assert 'LOAD' in source
    assert 'RET' in source
    assert 'fibonacci' in source.lower() or 'loop' in source.lower()


def test_load_template_counter():
    """Test loading counter template"""
    source = load_template('counter')
    assert 'ADD' in source or 'SUB' in source
    assert 'loop' in source.lower()


def test_load_invalid_template_raises():
    """Test that invalid template name raises error"""
    with pytest.raises(FileNotFoundError):
        load_template('nonexistent_template')

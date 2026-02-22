#!/usr/bin/env python3
"""Tests for wasmrun CLI tool"""

import pytest
import sys
from pathlib import Path
import subprocess
import tempfile
import json

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))


def test_cli_help():
    """Test that CLI help works"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert result.returncode == 0
    assert "wasmrun" in result.stdout.lower()
    assert "--entry" in result.stdout
    assert "--trace" in result.stdout
    assert "--dump-memory" in result.stdout
    assert "--memory-pages" in result.stdout
    assert "--max-instructions" in result.stdout


def test_cli_requires_input_file():
    """Test that CLI requires input file"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun"],
        capture_output=True,
        text=True
    )
    assert result.returncode != 0
    # Should error about missing input file


def test_cli_with_invalid_file():
    """Test that CLI handles invalid file gracefully"""
    with tempfile.NamedTemporaryFile(mode="w", suffix=".wasm", delete=False) as f:
        f.write("invalid wasm data")
        f.flush()
        temp_path = f.name

    try:
        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.wasmrun", temp_path],
            capture_output=True,
            text=True
        )
        # Should fail with invalid WASM
        assert result.returncode != 0
    finally:
        Path(temp_path).unlink()


def test_cli_entry_argument():
    """Test --entry argument parsing"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert "--entry" in result.stdout
    assert "ENTRY" in result.stdout or "function" in result.stdout.lower()


def test_cli_trace_argument():
    """Test --trace argument parsing"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert "--trace" in result.stdout
    assert "FILE" in result.stdout or "trace" in result.stdout.lower()


def test_cli_dump_memory_argument():
    """Test --dump-memory argument parsing"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert "--dump-memory" in result.stdout
    assert "FILE" in result.stdout or "memory" in result.stdout.lower()


def test_cli_memory_pages_argument():
    """Test --memory-pages argument parsing"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert "--memory-pages" in result.stdout
    assert "N" in result.stdout or "pages" in result.stdout.lower()


def test_cli_max_instructions_argument():
    """Test --max-instructions argument parsing"""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.wasmrun", "--help"],
        capture_output=True,
        text=True
    )
    assert "--max-instructions" in result.stdout
    assert "N" in result.stdout or "instructions" in result.stdout.lower()


def test_cli_accepts_wasm_extension():
    """Test that CLI accepts .wasm files"""
    # Create a minimal valid WASM file
    wasm_bytes = create_minimal_wasm()
    with tempfile.NamedTemporaryFile(mode="wb", suffix=".wasm", delete=False) as f:
        f.write(wasm_bytes)
        f.flush()
        temp_path = f.name

    try:
        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.wasmrun", temp_path],
            capture_output=True,
            text=True,
            timeout=5
        )
        # Should not crash on valid WASM (even if execution isn't fully implemented yet)
        # The tool should at least load and validate the file
    finally:
        Path(temp_path).unlink()


def test_cli_accepts_rts_png_extension():
    """Test that CLI accepts .rts.png files"""
    # Create a mock .rts.png file (valid PNG with minimal WASM)
    from PIL import Image
    import numpy as np

    wasm_bytes = create_minimal_wasm()

    # Create a simple PNG with RGBA data
    # For now, just create a minimal valid PNG
    img_array = np.zeros((16, 16, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, mode='RGBA')

    with tempfile.NamedTemporaryFile(mode="wb", suffix=".rts.png", delete=False) as f:
        img.save(f)
        f.flush()
        temp_path = f.name

    try:
        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.wasmrun", temp_path],
            capture_output=True,
            text=True,
            timeout=5
        )
        # Should not crash - will handle the PNG file
    finally:
        Path(temp_path).unlink()


def create_minimal_wasm() -> bytes:
    """Create a minimal valid WASM file for testing"""
    # WASM magic number and version
    header = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

    # Type section (function type: [] -> [])
    type_section = b'\x01\x04\x01\x60\x00\x00'

    # Function section (1 function, uses type 0)
    func_section = b'\x03\x02\x01\x00'

    # Export section (export "main" as function 0)
    export_section = b'\x07\x0b\x01\x04main\x00\x00'

    # Code section (empty function body: just end opcode)
    code_section = b'\x0a\x04\x01\x02\x00\x0b'

    return header + type_section + func_section + export_section + code_section


def test_argument_parsing_via_module():
    """Test argument parsing when importing the module"""
    from wasmrun import parse_args

    # Test default arguments
    args = parse_args(["test.wasm"])
    assert args.input == "test.wasm"
    assert args.entry == 0
    assert args.trace is None
    assert args.dump_memory is None
    assert args.memory_pages == 256
    assert args.max_instructions == 100000

    # Test with entry argument
    args = parse_args(["test.wasm", "--entry", "5"])
    assert args.entry == 5

    # Test with trace argument
    args = parse_args(["test.wasm", "--trace", "out.json"])
    assert args.trace == "out.json"

    # Test with dump-memory argument
    args = parse_args(["test.wasm", "--dump-memory", "mem.bin"])
    assert args.dump_memory == "mem.bin"

    # Test with memory-pages argument
    args = parse_args(["test.wasm", "--memory-pages", "512"])
    assert args.memory_pages == 512

    # Test with max-instructions argument
    args = parse_args(["test.wasm", "--max-instructions", "50000"])
    assert args.max_instructions == 50000


def test_rts_png_detection():
    """Test detection of .rts.png files"""
    from wasmrun import is_rts_png

    assert is_rts_png("test.rts.png") == True
    assert is_rts_png("test.png") == False
    assert is_rts_png("test.wasm") == False
    assert is_rts_png("/path/to/file.rts.png") == True


def test_input_validation():
    """Test input file validation"""
    from wasmrun import validate_input_file
    import tempfile

    # Test non-existent file
    with pytest.raises(FileNotFoundError):
        validate_input_file("/nonexistent/file.wasm")

    # Test valid file (exists)
    with tempfile.NamedTemporaryFile(suffix=".wasm", delete=False) as f:
        temp_path = f.name

    try:
        # Should not raise
        validate_input_file(temp_path)
    finally:
        Path(temp_path).unlink()

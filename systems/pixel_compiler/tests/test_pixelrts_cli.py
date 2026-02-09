"""
Tests for unified PixelRTS CLI.
"""

import pytest
import tempfile
import subprocess
import sys
from pathlib import Path


def test_cli_help():
    """Test that CLI shows help."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli", "--help"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    assert result.returncode == 0
    assert "PixelRTS v2" in result.stdout
    assert "convert" in result.stdout
    assert "benchmark" in result.stdout
    assert "dashboard" in result.stdout
    assert "info" in result.stdout


def test_cli_convert_help():
    """Test that convert command shows help."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli", "convert", "--help"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    assert result.returncode == 0
    assert "--parallel" in result.stdout
    assert "--workers" in result.stdout
    assert "--mmap-threshold" in result.stdout


def test_cli_convert_single_file():
    """Test converting a single file via CLI."""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        input_file = tmpdir / "test.bin"
        output_file = tmpdir / "test.rts.png"

        # Create test data
        input_file.write_bytes(b'\x00\x01\x02\x03' * 1024)

        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli",
             "convert", str(input_file), str(output_file)],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert output_file.exists()


def test_cli_convert_with_metadata():
    """Test converting with metadata via CLI."""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        input_file = tmpdir / "kernel.bin"
        output_file = tmpdir / "kernel.rts.png"

        # Create test data
        input_file.write_bytes(b'\x00' * 2048)

        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli",
             "convert", str(input_file), str(output_file),
             "--type", "kernel",
             "--name", "test_kernel",
             "--version", "1.0"],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert output_file.exists()

        # Check metadata
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        decoder = PixelRTSDecoder()
        info = decoder.info(str(output_file))
        assert info.get('type') == 'kernel'


def test_cli_benchmark_help():
    """Test that benchmark command shows help."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli", "benchmark", "--help"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    # Should pass (benchmark forwards to its own help)
    assert "--sizes" in result.stdout or "usage" in result.stdout.lower()


def test_cli_dashboard_help():
    """Test that dashboard command shows help."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli", "dashboard", "--help"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    assert result.returncode == 0
    assert "--output" in result.stdout


def test_cli_info_command():
    """Test info command."""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        input_file = tmpdir / "test.bin"
        output_file = tmpdir / "test.rts.png"

        # Create and encode test data using CLI to ensure sidecar is created
        input_file.write_bytes(b'\x00\x01\x02\x03' * 512)

        # First encode using CLI (which saves sidecar)
        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli",
             "convert", str(input_file), str(output_file)],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )
        assert result.returncode == 0

        # Now use CLI info command
        result = subprocess.run(
            [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli",
             "info", str(output_file)],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert "File:" in result.stdout
        assert "Grid Size:" in result.stdout


def test_cli_no_command_shows_help():
    """Test that running without command shows help."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    assert result.returncode == 1  # Should error but show help


def test_cli_invalid_command():
    """Test that invalid command shows error."""
    result = subprocess.run(
        [sys.executable, "-m", "systems.pixel_compiler.pixelrts_cli", "invalid_command"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    # Should fail
    assert result.returncode != 0


def test_cli_imports():
    """Test that CLI module can be imported."""
    from systems.pixel_compiler.pixelrts_cli import main, cmd_convert, cmd_benchmark, cmd_dashboard, cmd_info
    assert callable(main)
    assert callable(cmd_convert)
    assert callable(cmd_benchmark)
    assert callable(cmd_dashboard)
    assert callable(cmd_info)

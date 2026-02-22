#!/usr/bin/env python3
"""
Tests for PixelRTS Vision CLI tool

Tests follow TDD principles - write the test first, then implement.
"""

import pytest
import sys
from pathlib import Path
import subprocess
import tempfile
import json
from PIL import Image
import numpy as np

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

# Path to CLI script
CLI_PATH = Path(__file__).parent.parent / "pixelrts_vision_cli.py"


def create_minimal_rts_png(path: str) -> None:
    """Create a minimal valid .rts.png file for testing."""
    # Create a simple PNG with RGBA data
    img_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, mode='RGBA')
    img.save(path)


def test_cli_help():
    """Test that CLI help works."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert result.returncode == 0
    assert "vision" in result.stdout.lower() or "analysis" in result.stdout.lower()


def test_cli_requires_input_file():
    """Test that CLI requires input file."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH)],
        capture_output=True,
        text=True
    )
    assert result.returncode != 0


def test_cli_with_invalid_file():
    """Test that CLI handles invalid file gracefully."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "/nonexistent/file.rts.png"],
        capture_output=True,
        text=True
    )
    assert result.returncode != 0


def test_cli_provider_argument():
    """Test --provider argument parsing."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert "--provider" in result.stdout
    assert "lm_studio" in result.stdout or "openai" in result.stdout


def test_cli_api_key_argument():
    """Test --api-key argument parsing."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert "--api-key" in result.stdout


def test_cli_output_argument():
    """Test --output argument parsing."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert "--output" in result.stdout or "-o" in result.stdout


def test_cli_overlays_only_argument():
    """Test --overlays-only argument parsing."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert "--overlays-only" in result.stdout


def test_cli_dry_run_argument():
    """Test --dry-run argument parsing."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert "--dry-run" in result.stdout


def test_cli_runs_analysis_dry_run():
    """Test that CLI runs analysis in dry-run mode."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        output_dir = Path(tmpdir) / "output"
        result = subprocess.run(
            [
                sys.executable, str(CLI_PATH),
                str(rts_path),
                "--output", str(output_dir),
                "--dry-run"
            ],
            capture_output=True,
            text=True
        )

        # Dry-run should succeed (doesn't call vision API)
        assert result.returncode == 0
        # Should mention what would be done
        assert "dry" in result.stdout.lower() or "would" in result.stdout.lower()


def test_cli_generates_overlays():
    """Test that CLI generates overlay images."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        output_dir = Path(tmpdir) / "output"
        result = subprocess.run(
            [
                sys.executable, str(CLI_PATH),
                str(rts_path),
                "--output", str(output_dir),
                "--overlays-only"
            ],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Check that entropy overlay was generated
        # The analyzer uses Path.stem which for "test.rts.png" is "test.rts"
        # So the output file is "test.rts_entropy_overlay.png"
        entropy_overlay = output_dir / "test.rts_entropy_overlay.png"
        assert entropy_overlay.exists()


def test_cli_with_metadata():
    """Test CLI with .meta.json sidecar."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        # Create metadata sidecar
        meta_path = Path(tmpdir) / "test.rts.png.meta.json"
        metadata = {
            "format": "PixelRTS v2",
            "grid_size": 64,
            "data_size": 16384,
            "type": "kernel"
        }
        with open(meta_path, 'w') as f:
            json.dump(metadata, f)

        output_dir = Path(tmpdir) / "output"
        result = subprocess.run(
            [
                sys.executable, str(CLI_PATH),
                str(rts_path),
                "--output", str(output_dir),
                "--overlays-only"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        # Should mention metadata/format in output
        assert "format" in result.stdout.lower() or "pixelrts" in result.stdout.lower()


def test_argument_parsing_via_module():
    """Test argument parsing when importing the module."""
    # Import via systems.pixel_compiler
    from pixelrts_vision_cli import parse_args

    # Test default arguments
    args = parse_args(["test.rts.png"])
    assert args.rts_file == Path("test.rts.png")
    assert args.provider == "lm_studio"
    assert args.api_key is None
    assert args.output == Path("./pixelrts_vision_output")
    assert args.overlays_only is False
    assert args.dry_run is False

    # Test with provider argument
    args = parse_args(["test.rts.png", "--provider", "openai"])
    assert args.provider == "openai"

    # Test with api-key argument
    args = parse_args(["test.rts.png", "--api-key", "test-key-123"])
    assert args.api_key == "test-key-123"

    # Test with output argument
    args = parse_args(["test.rts.png", "--output", "./results"])
    assert args.output == Path("./results")

    # Test with overlays-only argument
    args = parse_args(["test.rts.png", "--overlays-only"])
    assert args.overlays_only is True

    # Test with dry-run argument
    args = parse_args(["test.rts.png", "--dry-run"])
    assert args.dry_run is True


def test_cli_creates_output_directory():
    """Test that CLI creates output directory if it doesn't exist."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        output_dir = Path(tmpdir) / "nested" / "output" / "dir"
        result = subprocess.run(
            [
                sys.executable, str(CLI_PATH),
                str(rts_path),
                "--output", str(output_dir),
                "--overlays-only"
            ],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Directory should be created
        assert output_dir.exists()


def test_cli_generates_summary():
    """Test that CLI generates summary information."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        output_dir = Path(tmpdir) / "output"
        result = subprocess.run(
            [
                sys.executable, str(CLI_PATH),
                str(rts_path),
                "--output", str(output_dir),
                "--overlays-only"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        # Output should contain summary information
        assert "width" in result.stdout.lower() or "height" in result.stdout.lower() or "pixel" in result.stdout.lower()


def test_main_function_exists():
    """Test that main function is callable."""
    from pixelrts_vision_cli import main

    # main should be callable
    assert callable(main)

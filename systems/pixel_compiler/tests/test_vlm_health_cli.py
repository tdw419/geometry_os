#!/usr/bin/env python3
"""
Tests for VLM Health CLI tool

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
CLI_PATH = Path(__file__).parent.parent / "vlm_health_cli.py"


def create_minimal_rts_png(path: str) -> None:
    """Create a minimal valid .rts.png file for testing."""
    # Create a simple PNG with RGBA data
    img_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, mode='RGBA')
    img.save(path)


def create_health_baseline(path: str, data: dict) -> None:
    """Create a health baseline JSON file for testing."""
    with open(path, 'w') as f:
        json.dump(data, f)


def test_cli_help():
    """Test that CLI help works."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "--help"],
        capture_output=True,
        text=True
    )
    assert result.returncode == 0
    assert "vlm" in result.stdout.lower() or "health" in result.stdout.lower()
    assert "check" in result.stdout.lower()
    assert "monitor" in result.stdout.lower()
    assert "baseline" in result.stdout.lower()


def test_cli_check_command():
    """Test the check command."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "check", str(rts_path)],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Should output health information
        assert "health" in result.stdout.lower() or "status" in result.stdout.lower()


def test_cli_json_output():
    """Test JSON output format."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "check", str(rts_path), "--json"],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Should be valid JSON
        try:
            data = json.loads(result.stdout)
            assert isinstance(data, dict)
            # Should have health-related fields
            assert "health" in data or "status" in data or "score" in data
        except json.JSONDecodeError:
            pytest.fail("Output is not valid JSON")


def test_cli_monitor_command():
    """Test the monitor command."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        # Run monitor with limited iterations
        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "monitor", str(rts_path), "--iterations", "1"],
            capture_output=True,
            text=True,
            timeout=10
        )

        # Should succeed
        assert result.returncode == 0
        # Should mention monitoring
        assert "monitor" in result.stdout.lower() or "iteration" in result.stdout.lower()


def test_cli_baseline_command():
    """Test the baseline command."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        baseline_path = Path(tmpdir) / "baseline.json"

        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "baseline", str(rts_path), "-o", str(baseline_path)],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Baseline file should be created
        assert baseline_path.exists()


def test_cli_check_with_baseline():
    """Test check command with baseline comparison."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        # First create a baseline using the baseline command
        baseline_path = Path(tmpdir) / "baseline.json"
        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "baseline", str(rts_path), "-o", str(baseline_path)],
            capture_output=True,
            text=True
        )
        # Ensure baseline was created successfully
        assert result.returncode == 0
        assert baseline_path.exists()

        # Then check against baseline
        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "check", str(rts_path), "--baseline", str(baseline_path)],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Should mention baseline or comparison
        assert "baseline" in result.stdout.lower() or "comparison" in result.stdout.lower() or "deviation" in result.stdout.lower()


def test_cli_verbose_output():
    """Test verbose output mode."""
    with tempfile.TemporaryDirectory() as tmpdir:
        rts_path = Path(tmpdir) / "test.rts.png"
        create_minimal_rts_png(str(rts_path))

        result = subprocess.run(
            [sys.executable, str(CLI_PATH), "check", str(rts_path), "--verbose"],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        # Verbose output should have more details
        assert len(result.stdout) > 0


def test_cli_invalid_file():
    """Test that CLI handles invalid file gracefully."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH), "check", "/nonexistent/file.rts.png"],
        capture_output=True,
        text=True
    )
    assert result.returncode != 0


def test_cli_no_command():
    """Test that CLI requires a command."""
    result = subprocess.run(
        [sys.executable, str(CLI_PATH)],
        capture_output=True,
        text=True
    )
    # Should fail or show help
    assert result.returncode != 0 or "usage" in result.stdout.lower()


def test_argument_parsing_via_module():
    """Test argument parsing when importing the module."""
    from vlm_health_cli import parse_args

    # Test check command
    args = parse_args(["check", "test.rts.png"])
    assert args.command == "check"
    assert args.rts_file == "test.rts.png"
    assert args.json is False
    assert args.verbose is False

    # Test check command with --json
    args = parse_args(["check", "test.rts.png", "--json"])
    assert args.json is True

    # Test check command with --baseline
    args = parse_args(["check", "test.rts.png", "--baseline", "baseline.json"])
    assert args.baseline == "baseline.json"

    # Test monitor command
    args = parse_args(["monitor", "test.rts.png"])
    assert args.command == "monitor"
    assert args.iterations == 5  # default

    # Test monitor command with custom iterations
    args = parse_args(["monitor", "test.rts.png", "--iterations", "10"])
    assert args.iterations == 10

    # Test baseline command
    args = parse_args(["baseline", "test.rts.png"])
    assert args.command == "baseline"
    assert args.output == "baseline.json"  # default

    # Test baseline command with custom output
    args = parse_args(["baseline", "test.rts.png", "-o", "custom.json"])
    assert args.output == "custom.json"


def test_main_function_exists():
    """Test that main function is callable."""
    from vlm_health_cli import main

    # main should be callable
    assert callable(main)


def test_vitality_score_calculation():
    """Test vitality score calculation logic."""
    from vlm_health_cli import calculate_vitality_score

    # High entropy, high variance = healthy
    score1 = calculate_vitality_score(entropy_mean=150, entropy_std=60)
    assert score1 > 0.5

    # Low entropy, low variance = sparse/less healthy
    score2 = calculate_vitality_score(entropy_mean=30, entropy_std=10)
    assert score2 < score1

    # Extreme entropy (possibly compressed) = different score
    score3 = calculate_vitality_score(entropy_mean=230, entropy_std=20)
    assert 0 <= score3 <= 1

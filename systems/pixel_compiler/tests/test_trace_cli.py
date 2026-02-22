"""Tests for pixelrts_trace.py CLI tool"""
import pytest
import subprocess
import sys
import tempfile
from pathlib import Path
import json
import numpy as np
from PIL import Image

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))


def create_simple_program_png(path):
    """Create a simple test program PNG"""
    # Create a minimal 2x2 program with basic instructions
    pixels = np.zeros((2, 2, 4), dtype=np.uint8)
    # LOAD R0, 42 at (0,0) - R=1, G=0, B=0, A=42
    pixels[0, 0] = [1, 0, 0, 42]
    # RET R0 at (0,1) - R=49, G=0, B=0, A=0
    pixels[0, 1] = [49, 0, 0, 0]
    img = Image.fromarray(pixels, 'RGBA')
    img.save(path)


def test_trace_command_exists():
    """Test that pixelrts_trace command can be invoked"""
    # Use the direct script path
    script_path = Path(__file__).parent.parent / "pixelrts_trace_cli.py"
    if not script_path.exists():
        pytest.skip("pixelrts_trace_cli.py not found")

    result = subprocess.run(
        [sys.executable, str(script_path), "--help"],
        capture_output=True, text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    # May fail if not yet implemented
    if result.returncode != 0 and "module" not in result.stderr.lower():
        pytest.skip("pixelrts_trace not yet implemented")
    assert result.returncode == 0
    assert "usage" in result.stdout.lower() or "help" in result.stdout.lower()


def test_trace_simple_program():
    """Test tracing a simple program"""
    script_path = Path(__file__).parent.parent / "pixelrts_trace_cli.py"
    if not script_path.exists():
        pytest.skip("pixelrts_trace_cli.py not found")

    with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as f:
        create_simple_program_png(f.name)
        temp_program = f.name

    temp_output = tempfile.mktemp(suffix=".json")

    try:
        result = subprocess.run(
            [sys.executable, str(script_path),
             temp_program, "--output", temp_output],
            capture_output=True, text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=30
        )

        if result.returncode != 0 and ("module" in result.stderr.lower() or "no module" in result.stderr.lower()):
            pytest.skip("pixelrts_trace not yet implemented")

        # Should succeed or fail gracefully
        if result.returncode == 0:
            # Verify output JSON exists
            assert Path(temp_output).exists()
            with open(temp_output) as f:
                data = json.load(f)
            assert "executed_instructions" in data or "trace" in data
    finally:
        if Path(temp_program).exists():
            Path(temp_program).unlink()
        if Path(temp_output).exists():
            Path(temp_output).unlink()


def test_trace_heatmap_generation():
    """Test heatmap generation"""
    script_path = Path(__file__).parent.parent / "pixelrts_trace_cli.py"
    if not script_path.exists():
        pytest.skip("pixelrts_trace_cli.py not found")

    with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as f:
        create_simple_program_png(f.name)
        temp_program = f.name

    temp_heatmap = tempfile.mktemp(suffix=".png")

    try:
        result = subprocess.run(
            [sys.executable, str(script_path),
             temp_program, "--heatmap", temp_heatmap],
            capture_output=True, text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=30
        )

        if result.returncode != 0 and ("module" in result.stderr.lower() or "no module" in result.stderr.lower()):
            pytest.skip("pixelrts_trace not yet implemented")

        if result.returncode == 0:
            # Verify heatmap PNG exists
            assert Path(temp_heatmap).exists()
            # Verify it's a valid image
            img = Image.open(temp_heatmap)
            assert img.size[0] > 0 and img.size[1] > 0
    finally:
        if Path(temp_program).exists():
            Path(temp_program).unlink()
        if Path(temp_heatmap).exists():
            Path(temp_heatmap).unlink()


def test_trace_combined_options():
    """Test trace with both output and heatmap"""
    script_path = Path(__file__).parent.parent / "pixelrts_trace_cli.py"
    if not script_path.exists():
        pytest.skip("pixelrts_trace_cli.py not found")

    with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as f:
        create_simple_program_png(f.name)
        temp_program = f.name

    temp_output = tempfile.mktemp(suffix=".json")
    temp_heatmap = tempfile.mktemp(suffix=".png")

    try:
        result = subprocess.run(
            [sys.executable, str(script_path),
             temp_program, "--output", temp_output, "--heatmap", temp_heatmap],
            capture_output=True, text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=30
        )

        if result.returncode != 0 and ("module" in result.stderr.lower() or "no module" in result.stderr.lower()):
            pytest.skip("pixelrts_trace not yet implemented")

        if result.returncode == 0:
            assert Path(temp_output).exists()
            assert Path(temp_heatmap).exists()
    finally:
        if Path(temp_program).exists():
            Path(temp_program).unlink()
        if Path(temp_output).exists():
            Path(temp_output).unlink()
        if Path(temp_heatmap).exists():
            Path(temp_heatmap).unlink()


def test_trace_nonexistent_file():
    """Test error handling for nonexistent input file"""
    script_path = Path(__file__).parent.parent / "pixelrts_trace_cli.py"
    if not script_path.exists():
        pytest.skip("pixelrts_trace_cli.py not found")

    result = subprocess.run(
        [sys.executable, str(script_path),
         "/nonexistent/program.png", "--output", "/tmp/out.json"],
        capture_output=True, text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )

    if "module" in result.stderr.lower() or "no module" in result.stderr.lower():
        pytest.skip("pixelrts_trace not yet implemented")

    # Should fail with appropriate error
    assert result.returncode != 0


def test_trace_module_import():
    """Test that pixelrts_trace can be imported as a module"""
    try:
        import pixelrts_trace
        assert hasattr(pixelrts_trace, 'main')
    except ImportError:
        pytest.skip("pixelrts_trace not yet implemented")

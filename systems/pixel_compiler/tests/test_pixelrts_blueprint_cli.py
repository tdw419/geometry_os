"""Tests for PixelRTS CLI blueprint commands."""

import pytest
import tempfile
import json
import subprocess
import sys
from pathlib import Path
from PIL import Image


def run_cli(args):
    """Run CLI as subprocess and return result."""
    cmd = [sys.executable, '-m', 'systems.pixel_compiler.pixelrts_cli'] + args
    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
    )
    return result


def test_blueprint_generate_command():
    """Test blueprint generate command creates blueprint file."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test binary file
        test_binary = Path(tmpdir) / "test.bin"
        test_binary.write_bytes(b'\x7fELF' + b'\x00' * 1000)

        output_png = Path(tmpdir) / "test.rts.png"

        result = run_cli([
            'blueprint', 'generate',
            str(test_binary),
            '--output', str(output_png),
            '--system-name', 'Test System'
        ])

        # Command should succeed
        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert output_png.exists()

        # Verify blueprint sidecar was created
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        assert blueprint_path.exists()

        # Verify blueprint content
        with open(blueprint_path) as f:
            saved_blueprint = json.load(f)

        assert saved_blueprint["system_name"] == "Test System"


def test_blueprint_generate_with_all_options():
    """Test blueprint generate with all options."""
    with tempfile.TemporaryDirectory() as tmpdir:
        test_binary = Path(tmpdir) / "kernel.bin"
        test_binary.write_bytes(b'\x7fELF' + b'\x00' * 5000)

        output_png = Path(tmpdir) / "kernel.rts.png"

        result = run_cli([
            'blueprint', 'generate',
            str(test_binary),
            '--output', str(output_png),
            '--system-name', 'Linux Kernel',
            '--system-type', 'executable',
            '--architecture', 'x86_64',
            '--mode', 'standard'
        ])

        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert output_png.exists()

        # Verify blueprint has correct metadata
        blueprint_path = Path(tmpdir) / "kernel.rts.png.blueprint.json"
        with open(blueprint_path) as f:
            blueprint = json.load(f)

        assert blueprint["system_name"] == "Linux Kernel"
        assert blueprint["system_type"] == "executable"
        assert blueprint["architecture"] == "x86_64"


def test_blueprint_view_command():
    """Test blueprint view command creates overlay."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test PNG and blueprint
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        # Create blueprint sidecar
        blueprint = {
            "blueprint_version": "1.0",
            "system_name": "Test",
            "system_type": "",
            "architecture": "",
            "components": [
                {
                    "id": "test_component",
                    "type": "data",
                    "description": "Test component",
                    "hilbert_range": {
                        "start_index": 0,
                        "end_index": 100,
                        "pixel_start": [0, 0],
                        "pixel_end": [10, 10]
                    },
                    "entropy_profile": "low",
                    "visual_hint": "blue_dominant",
                    "dependencies": [],
                    "semantic_tags": [],
                    "security": None
                }
            ],
            "memory_map": [],
            "entry_point": None,
            "visual_overlay": {
                "grid_overlay": True,
                "color_key": "semantic",
                "legend": "",
                "highlight_boundaries": True,
                "boundary_color": [255, 255, 0, 128]
            }
        }
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        with open(blueprint_path, 'w') as f:
            json.dump(blueprint, f)

        output_overlay = Path(tmpdir) / "overlay.png"

        result = run_cli([
            'blueprint', 'view',
            str(test_png),
            '--output', str(output_overlay)
        ])

        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert output_overlay.exists()


def test_blueprint_view_with_html():
    """Test blueprint view command generates HTML."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test PNG and blueprint
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        blueprint = {
            "blueprint_version": "1.0",
            "system_name": "HTML Test",
            "system_type": "Test",
            "architecture": "x86_64",
            "components": [],
            "memory_map": [],
            "entry_point": None,
            "visual_overlay": {
                "grid_overlay": True,
                "color_key": "semantic",
                "legend": "",
                "highlight_boundaries": True,
                "boundary_color": [255, 255, 0, 128]
            }
        }
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        with open(blueprint_path, 'w') as f:
            json.dump(blueprint, f)

        output_html = Path(tmpdir) / "view.html"

        result = run_cli([
            'blueprint', 'view',
            str(test_png),
            '--html',
            '--output', str(output_html)
        ])

        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert output_html.exists()

        # Verify HTML content
        with open(output_html) as f:
            html_content = f.read()

        assert '<!DOCTYPE html>' in html_content
        assert 'HTML Test' in html_content


def test_blueprint_view_no_grid():
    """Test blueprint view with grid disabled."""
    with tempfile.TemporaryDirectory() as tmpdir:
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        blueprint = {
            "blueprint_version": "1.0",
            "system_name": "Test",
            "system_type": "",
            "architecture": "",
            "components": [],
            "memory_map": [],
            "entry_point": None,
            "visual_overlay": {
                "grid_overlay": True,
                "color_key": "semantic",
                "legend": "",
                "highlight_boundaries": True,
                "boundary_color": [255, 255, 0, 128]
            }
        }
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        with open(blueprint_path, 'w') as f:
            json.dump(blueprint, f)

        output_overlay = Path(tmpdir) / "overlay.png"

        result = run_cli([
            'blueprint', 'view',
            str(test_png),
            '--output', str(output_overlay),
            '--no-grid'
        ])

        # Check for success
        if result.returncode != 0:
            print(f"STDOUT: {result.stdout}")
            print(f"STDERR: {result.stderr}")

        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert output_overlay.exists()


def test_blueprint_analyze_command():
    """Test blueprint analyze command displays blueprint info."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test PNG and blueprint
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        blueprint = {
            "blueprint_version": "1.0",
            "system_name": "Analyze Test",
            "system_type": "Linux Kernel",
            "architecture": "x86_64",
            "entry_point": "0x1000",
            "components": [
                {
                    "id": "kernel",
                    "type": "executable",
                    "description": "Linux Kernel",
                    "hilbert_range": {
                        "start_index": 0,
                        "end_index": 1000,
                        "pixel_start": [0, 0],
                        "pixel_end": [32, 32]
                    },
                    "entropy_profile": "high",
                    "visual_hint": "red_dominant",
                    "dependencies": [],
                    "semantic_tags": ["boot"],
                    "security": None
                }
            ],
            "memory_map": [
                {"region": ".text", "permissions": "rx", "gpu_alignment": 256}
            ],
            "visual_overlay": {
                "grid_overlay": True,
                "color_key": "semantic",
                "legend": "",
                "highlight_boundaries": True,
                "boundary_color": [255, 255, 0, 128]
            }
        }
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        with open(blueprint_path, 'w') as f:
            json.dump(blueprint, f)

        result = run_cli([
            'blueprint', 'analyze',
            str(test_png)
        ])

        assert result.returncode == 0, f"CLI failed: {result.stderr}"
        assert "Analyze Test" in result.stdout
        assert "Linux Kernel" in result.stdout
        assert "x86_64" in result.stdout
        assert "0x1000" in result.stdout
        assert "kernel" in result.stdout
        assert ".text" in result.stdout


def test_blueprint_analyze_no_blueprint():
    """Test blueprint analyze handles missing blueprint gracefully."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test PNG without blueprint
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        result = run_cli([
            'blueprint', 'analyze',
            str(test_png)
        ])

        # Should fail with error message
        assert result.returncode != 0
        # Check stderr for "no blueprint found" (case-insensitive)
        assert "no blueprint found" in result.stderr.lower() or "error" in result.stderr.lower()


def test_blueprint_generate_creates_metadata():
    """Test blueprint generate also creates standard metadata."""
    with tempfile.TemporaryDirectory() as tmpdir:
        test_binary = Path(tmpdir) / "test.bin"
        test_binary.write_bytes(b'\x7fELF' + b'\x00' * 1000)

        output_png = Path(tmpdir) / "test.rts.png"

        result = run_cli([
            'blueprint', 'generate',
            str(test_binary),
            '--output', str(output_png)
        ])

        assert result.returncode == 0, f"CLI failed: {result.stderr}"

        # Verify both blueprint and metadata sidecars were created
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"
        meta_path = Path(tmpdir) / "test.rts.png.meta.json"

        assert blueprint_path.exists()
        assert meta_path.exists()


def test_blueprint_help():
    """Test blueprint commands show help."""
    result = run_cli(['blueprint', '--help'])

    assert result.returncode == 0
    assert 'generate' in result.stdout
    assert 'view' in result.stdout
    assert 'analyze' in result.stdout

    # Test generate help
    result = run_cli(['blueprint', 'generate', '--help'])
    assert result.returncode == 0
    assert '--system-name' in result.stdout
    assert '--system-type' in result.stdout
    assert '--architecture' in result.stdout

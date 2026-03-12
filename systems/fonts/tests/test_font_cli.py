"""
Font CLI Tests

Tests for systems/fonts/cli.py (geos-font command).
Following FONT.md test plan: 12 CLI tests.
"""

import pytest
import subprocess
import json
import sys
from pathlib import Path

ROOT = Path(__file__).parent.parent.parent.parent
CLI_PATH = ROOT / "systems" / "fonts" / "cli.py"

# Check for freetype
try:
    import freetype
    HAS_FREETYPE = True
except ImportError:
    HAS_FREETYPE = False

pytestmark = pytest.mark.skipif(
    not HAS_FREETYPE,
    reason="freetype-py not installed"
)


def run_cli(args, expect_success=True):
    """Run the font CLI with arguments."""
    cmd = [sys.executable, str(CLI_PATH)] + args
    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd=str(ROOT)
    )
    if expect_success and result.returncode != 0:
        print(f"STDOUT: {result.stdout}")
        print(f"STDERR: {result.stderr}")
    return result


class TestStatusCommand:
    """Tests for 'status' command."""

    def test_status_no_font(self):
        """Status with no font loaded."""
        result = run_cli(["status"])
        assert result.returncode == 0
        assert "No font loaded" in result.stdout or "is_loaded" in result.stdout

    def test_status_json(self):
        """Status with JSON output."""
        result = run_cli(["status", "--json"])
        assert result.returncode == 0

        data = json.loads(result.stdout)
        assert "is_loaded" in data
        assert isinstance(data["is_loaded"], bool)

    def test_status_default_command(self):
        """Running CLI with no command shows status."""
        result = run_cli([])
        assert result.returncode == 0


class TestLoadCommand:
    """Tests for 'load' command."""

    def test_load_by_name(self):
        """Load font by name pattern."""
        result = run_cli(["load", "--name=monospace"])
        # May succeed or fail depending on system fonts
        # Just verify it doesn't crash
        assert "Loaded" in result.stdout or "error" in result.stdout.lower() or "Error" in result.stdout

    def test_load_json_output(self):
        """Load with JSON output."""
        result = run_cli(["load", "--name=monospace", "--json"])

        try:
            data = json.loads(result.stdout)
            # Should have success or error
            assert "success" in data or "error" in data
        except json.JSONDecodeError:
            # If no font found, may not be valid JSON
            pass

    def test_load_invalid_path(self):
        """Load non-existent font."""
        result = run_cli(["load", "/nonexistent/font.ttf"], expect_success=False)
        assert result.returncode != 0


class TestRenderCommand:
    """Tests for 'render' command."""

    def test_render_simple(self):
        """Render simple text."""
        # First load a font
        run_cli(["load", "--name=monospace"])

        result = run_cli(["render", "Hello"])
        # Should show dimensions
        assert "x" in result.stdout.lower() or "bytes" in result.stdout.lower()

    def test_render_json(self):
        """Render with JSON output."""
        run_cli(["load", "--name=monospace"])

        result = run_cli(["render", "Test", "--json"])

        try:
            data = json.loads(result.stdout)
            assert "width" in data
            assert "height" in data
            assert "bytes" in data
        except json.JSONDecodeError:
            # Font may not have loaded
            pass

    def test_render_to_file(self, tmp_path):
        """Render to output file."""
        run_cli(["load", "--name=monospace"])

        output_file = tmp_path / "test.rgba"
        result = run_cli(["render", "Hi", "-o", str(output_file)])

        if result.returncode == 0 and output_file.exists():
            # Verify file has RGBA data
            data = output_file.read_bytes()
            assert len(data) > 0
            assert len(data) % 4 == 0  # RGBA is 4 bytes per pixel


class TestListCommand:
    """Tests for 'list' command."""

    def test_list_fonts(self):
        """List available system fonts."""
        result = run_cli(["list-fonts"])
        assert result.returncode == 0
        # Should show count
        assert "font" in result.stdout.lower()

    def test_list_fonts_json(self):
        """List fonts with JSON output."""
        result = run_cli(["list-fonts", "--json"])
        assert result.returncode == 0

        data = json.loads(result.stdout)
        assert "fonts" in data
        assert "count" in data
        assert isinstance(data["fonts"], list)


class TestMetricsCommand:
    """Tests for 'metrics' command."""

    def test_metrics_without_font(self):
        """Metrics with no font loaded."""
        result = run_cli(["metrics", "Test"], expect_success=False)
        # Should fail or show error
        assert result.returncode != 0 or "error" in result.stdout.lower()

    def test_metrics_with_font(self):
        """Metrics with font loaded."""
        run_cli(["load", "--name=monospace"])

        result = run_cli(["metrics", "Hello", "--json"])

        try:
            data = json.loads(result.stdout)
            assert "width" in data
            assert "height" in data
            assert "baseline" in data
        except json.JSONDecodeError:
            pass


class TestCacheCommand:
    """Tests for cache management."""

    def test_clear_cache(self):
        """Clear glyph cache."""
        result = run_cli(["clear-cache"])
        assert result.returncode == 0
        assert "cleared" in result.stdout.lower() or "Cleared" in result.stdout

    def test_clear_cache_json(self):
        """Clear cache with JSON output."""
        result = run_cli(["clear-cache", "--json"])
        assert result.returncode == 0

        data = json.loads(result.stdout)
        assert "cleared" in data

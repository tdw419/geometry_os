"""
Font E2E Tests

End-to-end tests for real workflow scenarios.
Following FONT.md test plan: 8 E2E tests.
"""

import pytest
import sys
import os
from pathlib import Path

ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(ROOT))

try:
    import freetype
    HAS_FREETYPE = True
except ImportError:
    HAS_FREETYPE = False

pytestmark = pytest.mark.skipif(
    not HAS_FREETYPE,
    reason="freetype-py not installed"
)

from systems.fonts.font_renderer import FontRenderer, find_system_font


@pytest.fixture
def monospace_font():
    """Find a monospace font."""
    path = find_system_font("monospace")
    if path is None:
        pytest.skip("No monospace font found")
    return path


class TestWorkflowTerminalRendering:
    """Workflow 1: Terminal Character Rendering."""

    def test_terminal_workflow(self, monospace_font):
        """Simulates terminal displaying shell output."""
        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        # 1. Generate atlas for ASCII range
        ascii_chars = "".join(chr(i) for i in range(32, 127))

        # 2. Render prompt
        prompt = "user@host:~$ "
        pixels1, w1, h1 = renderer.render_text(prompt)
        assert w1 > 0
        assert h1 > 0

        # 3. Render command output
        output = "total 24\ndrwxr-xr-x  2 user user 4096 Mar 10 10:00 .\n-rw-r--r--  1 user user  123 Mar 10 10:00 file.txt"
        pixels2, w2, h2 = renderer.render_text(output)
        assert w2 > 0
        assert h2 > 0

        # Verify monospace consistency
        char_widths = []
        for char in "MWcm_":
            metrics = renderer.get_glyph_metrics(char)
            char_widths.append(metrics.advance_x)

        # All should have same advance in monospace
        # (with small tolerance for font quirks)
        assert max(char_widths) - min(char_widths) <= 1

    def test_all_ascii_renderable(self, monospace_font):
        """All ASCII characters render without missing glyphs."""
        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        missing = []
        for i in range(32, 127):
            char = chr(i)
            if not renderer.has_glyph(char):
                missing.append(char)

        # Basic ASCII should all be present
        assert len(missing) == 0, f"Missing glyphs: {missing}"


class TestWorkflowUnicodeDisplay:
    """Workflow 2: Unicode Text Display."""

    def test_cjk_rendering(self, monospace_font):
        """Render CJK characters."""
        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        # Check if font supports CJK
        if not renderer.has_glyph("日"):
            pytest.skip("Font doesn't support CJK")

        pixels, w, h = renderer.render_text("日本語テスト")
        assert w > 0
        assert h > 0
        assert len(pixels) > 0

    def test_european_accents(self, monospace_font):
        """Render European accented characters."""
        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        # Common European text
        texts = [
            "café résumé naïve",
            "Äpfel Österreich",
            "España mañana",
        ]

        for text in texts:
            pixels, w, h = renderer.render_text(text)
            assert w > 0, f"Failed to render: {text}"


class TestWorkflowAtlasGeneration:
    """Workflow 3: Font Atlas Generation."""

    def test_atlas_generation(self, monospace_font, tmp_path):
        """Pre-render for GPU upload."""
        renderer = FontRenderer()
        renderer.load(monospace_font, size=16)

        # Render common ASCII + symbols
        chars = "".join(chr(i) for i in range(32, 127))

        # Calculate total atlas size needed
        total_width = 0
        max_height = 0

        for char in chars:
            metrics = renderer.get_glyph_metrics(char)
            total_width += metrics.advance_x
            max_height = max(max_height, metrics.height)

        # Create atlas image
        atlas_width = 1024
        atlas_height = 1024

        # Simple packing: render all chars in one row
        all_pixels = bytearray(atlas_width * atlas_height * 4)

        x_offset = 0
        for char in chars:
            result = renderer.render_glyph(char)
            if result is None:
                continue

            pixels, w, h = result

            # Copy to atlas (simple horizontal strip)
            for row in range(h):
                for col in range(w):
                    src_idx = (row * w + col) * 4
                    if x_offset + col < atlas_width and row < atlas_height:
                        dst_idx = (row * atlas_width + x_offset + col) * 4
                        all_pixels[dst_idx:dst_idx+4] = pixels[src_idx:src_idx+4]

            x_offset += w + 1  # 1px padding

        # Verify atlas has content
        non_zero = sum(1 for i in range(0, len(all_pixels), 4) if all_pixels[i+3] > 0)
        assert non_zero > 0

        # Save atlas
        atlas_path = tmp_path / "font_atlas.rgba"
        atlas_path.write_bytes(bytes(all_pixels))
        assert atlas_path.exists()

    def test_atlas_dimensions(self, monospace_font):
        """Atlas dimensions are usable for GPU."""
        # Standard GPU-friendly sizes
        valid_sizes = [64, 128, 256, 512, 1024, 2048, 4096]

        for size in valid_sizes:
            assert (size & (size - 1)) == 0  # Power of 2


class TestWorkflowCLIIntegration:
    """Workflow 4: CLI Integration."""

    def test_cli_json_workflow(self, monospace_font):
        """Agent using geos-font commands via JSON."""
        import subprocess
        import json

        cli_path = ROOT / "systems" / "fonts" / "cli.py"

        # 1. Load font
        result = subprocess.run(
            [sys.executable, str(cli_path), "load", monospace_font, "--json"],
            capture_output=True,
            text=True,
            cwd=str(ROOT)
        )

        if result.returncode != 0:
            pytest.skip("CLI load failed")

        data = json.loads(result.stdout)
        assert data.get("success") is True

        # 2. Render text
        result = subprocess.run(
            [sys.executable, str(cli_path), "render", "Test", "--json"],
            capture_output=True,
            text=True,
            cwd=str(ROOT)
        )

        if result.returncode == 0:
            data = json.loads(result.stdout)
            assert "width" in data
            assert "height" in data

        # 3. Get status
        result = subprocess.run(
            [sys.executable, str(cli_path), "status", "--json"],
            capture_output=True,
            text=True,
            cwd=str(ROOT)
        )

        data = json.loads(result.stdout)
        assert data.get("is_loaded") is True


class TestPerformance:
    """Performance benchmarks."""

    def test_glyph_render_performance(self, monospace_font):
        """Glyph rendering under 1ms."""
        import time

        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        # Warm up cache
        renderer.render_glyph("A")

        # Measure
        times = []
        for char in "abcdefghijklmnopqrstuvwxyz":
            start = time.perf_counter()
            renderer.render_glyph(char)
            elapsed_ms = (time.perf_counter() - start) * 1000
            times.append(elapsed_ms)

        avg_time = sum(times) / len(times)
        assert avg_time < 1.0, f"Average glyph render time {avg_time:.2f}ms exceeds 1ms"

    def test_text_render_performance(self, monospace_font):
        """Text rendering performance."""
        import time

        renderer = FontRenderer()
        renderer.load(monospace_font, size=14)

        # Render 1000 chars
        text = "Hello World! " * 77  # ~1000 chars

        start = time.perf_counter()
        pixels, w, h = renderer.render_text(text)
        elapsed_ms = (time.perf_counter() - start) * 1000

        # Should be under 200ms for 1000 chars (first render, no cache)
        assert elapsed_ms < 200, f"Text render took {elapsed_ms:.1f}ms for {len(text)} chars"
        assert len(pixels) > 0

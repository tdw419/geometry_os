"""
Font Renderer Unit Tests

Tests for systems/fonts/font_renderer.py using real FreeType library.
Following FONT.md test plan: 15 unit tests.
"""

import pytest
import os
import sys
from pathlib import Path

# Add project root to path
ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(ROOT))

# Check for freetype
try:
    import freetype
    HAS_FREETYPE = True
except ImportError:
    HAS_FREETYPE = False

# Import after path setup
from systems.fonts.font_renderer import (
    FontRenderer,
    GlyphMetrics,
    TextMetrics,
    find_system_font,
)


# Skip all tests if freetype not installed
pytestmark = pytest.mark.skipif(
    not HAS_FREETYPE,
    reason="freetype-py not installed. Run: pip install freetype-py"
)


@pytest.fixture
def renderer():
    """Create a fresh FontRenderer for each test."""
    return FontRenderer()


@pytest.fixture
def monospace_font():
    """Find a monospace font on the system."""
    font_path = find_system_font("monospace")
    if font_path is None:
        pytest.skip("No monospace font found on system")
    return font_path


class TestFontLoading:
    """Tests for loading fonts."""

    def test_load_ttf_font(self, renderer, monospace_font):
        """Load real TTF file."""
        result = renderer.load(monospace_font, size=14)

        assert result["success"] is True
        assert result["font_path"] == monospace_font
        assert result["size"] == 14
        assert result["family_name"] is not None
        assert result["num_glyphs"] > 0
        assert result["load_time_ms"] > 0

    def test_load_otf_font(self, renderer):
        """Load real OTF file if available."""
        # Try to find an OTF font
        font_dirs = [
            "/usr/share/fonts",
            "/usr/local/share/fonts",
            os.path.expanduser("~/.local/share/fonts"),
        ]

        otf_path = None
        for font_dir in font_dirs:
            if not os.path.exists(font_dir):
                continue
            for root, dirs, files in os.walk(font_dir):
                for file in files:
                    if file.endswith(".otf"):
                        otf_path = os.path.join(root, file)
                        break
                if otf_path:
                    break
            if otf_path:
                break

        if otf_path is None:
            pytest.skip("No OTF font found on system")

        result = renderer.load(otf_path, size=12)
        assert result["success"] is True
        assert renderer.is_loaded is True

    def test_invalid_font_path(self, renderer):
        """Error handling for invalid font path."""
        with pytest.raises(FileNotFoundError):
            renderer.load("/nonexistent/font.ttf", size=14)

    def test_font_properties(self, renderer, monospace_font):
        """Family name, style, etc."""
        renderer.load(monospace_font, size=14)

        assert renderer.family_name is not None
        assert renderer.style_name is not None
        assert renderer.font_size == 14
        assert renderer.font_path == monospace_font
        assert renderer.is_loaded is True


class TestGlyphMetrics:
    """Tests for glyph metrics."""

    def test_get_glyph_metrics(self, renderer, monospace_font):
        """Return width, height, advance for a glyph."""
        renderer.load(monospace_font, size=14)

        metrics = renderer.get_glyph_metrics("A")

        assert isinstance(metrics, GlyphMetrics)
        assert metrics.char == "A"
        assert metrics.width > 0
        assert metrics.height > 0
        assert metrics.advance_x > 0

    def test_font_has_glyph(self, renderer, monospace_font):
        """Check if glyph exists in font."""
        renderer.load(monospace_font, size=14)

        # Common ASCII should exist
        assert renderer.has_glyph("A") is True
        assert renderer.has_glyph("a") is True
        assert renderer.has_glyph("0") is True
        assert renderer.has_glyph(" ") is True

    def test_render_glyph_out_of_range(self, renderer, monospace_font):
        """Handle Unicode beyond BMP."""
        renderer.load(monospace_font, size=14)

        # Emoji is beyond BMP - may or may not exist
        # Just verify it doesn't crash
        has_emoji = renderer.has_glyph("😀")
        # Most monospace fonts don't have emoji
        assert isinstance(has_emoji, bool)


class TestGlyphRendering:
    """Tests for rendering glyphs."""

    def test_render_single_glyph(self, renderer, monospace_font):
        """Render 'A' to pixels."""
        renderer.load(monospace_font, size=14)

        result = renderer.render_glyph("A")

        assert result is not None
        pixels, width, height = result
        assert width > 0
        assert height > 0
        assert len(pixels) == width * height * 4  # RGBA

        # Check that some pixels are non-transparent
        alphas = [pixels[i * 4 + 3] for i in range(width * height)]
        assert max(alphas) > 0  # At least some visible pixels

    def test_render_space(self, renderer, monospace_font):
        """Space character should return None (no bitmap)."""
        renderer.load(monospace_font, size=14)

        result = renderer.render_glyph(" ")
        # Space typically has no bitmap
        assert result is None


class TestTextRendering:
    """Tests for rendering text strings."""

    def test_render_text_simple(self, renderer, monospace_font):
        """'Hello' returns RGBA array."""
        renderer.load(monospace_font, size=14)

        pixels, width, height = renderer.render_text("Hello")

        assert width > 0
        assert height > 0
        assert len(pixels) == width * height * 4

        # Check that some pixels are visible
        alphas = [pixels[i * 4 + 3] for i in range(width * height)]
        assert max(alphas) > 0

    def test_render_text_unicode(self, renderer, monospace_font):
        """'日本語' renders correctly."""
        renderer.load(monospace_font, size=14)

        # Check if font has CJK glyphs
        if not renderer.has_glyph("日"):
            pytest.skip("Font doesn't support CJK characters")

        pixels, width, height = renderer.render_text("日本語")

        assert width > 0
        assert height > 0
        assert len(pixels) == width * height * 4

    def test_render_text_empty(self, renderer, monospace_font):
        """Empty string returns empty."""
        renderer.load(monospace_font, size=14)

        pixels, width, height = renderer.render_text("")

        assert pixels == b""
        assert width == 0
        assert height == 0

    def test_render_text_newlines(self, renderer, monospace_font):
        """Multiline text."""
        renderer.load(monospace_font, size=14)

        pixels1, w1, h1 = renderer.render_text("Hello")
        pixels2, w2, h2 = renderer.render_text("Hello\nWorld")

        # Multiline should be taller
        assert h2 > h1

        # Should have some visible pixels
        assert len(pixels2) > 0

    def test_text_bounding_box(self, renderer, monospace_font):
        """Calculate text dimensions."""
        renderer.load(monospace_font, size=14)

        metrics = renderer.get_text_metrics("Hello World")

        assert isinstance(metrics, TextMetrics)
        assert metrics.width > 0
        assert metrics.height > 0
        assert metrics.baseline > 0


class TestCache:
    """Tests for glyph caching."""

    def test_cache_hits(self, renderer, monospace_font):
        """Verify cache hit tracking."""
        renderer.load(monospace_font, size=14)

        # Render same character twice
        renderer.render_glyph("A")
        renderer.render_glyph("A")

        status = renderer.get_status()
        assert status["cache_hits"] >= 1
        assert status["cached_glyphs"] >= 1

    def test_clear_cache(self, renderer, monospace_font):
        """Clear glyph cache."""
        renderer.load(monospace_font, size=14)

        renderer.render_glyph("A")
        assert len(renderer._glyph_cache) > 0

        count = renderer.clear_cache()
        assert count > 0
        assert len(renderer._glyph_cache) == 0


class TestStatus:
    """Tests for status reporting."""

    def test_get_status(self, renderer, monospace_font):
        """Get current renderer status."""
        renderer.load(monospace_font, size=14)
        renderer.render_text("Test")

        status = renderer.get_status()

        assert status["is_loaded"] is True
        assert status["font_path"] == monospace_font
        assert status["size"] == 14
        assert status["family_name"] is not None
        assert status["render_count"] >= 1
        assert isinstance(status["cache_hit_rate"], (int, float))

    def test_unload(self, renderer, monospace_font):
        """Unload current font."""
        renderer.load(monospace_font, size=14)
        assert renderer.is_loaded is True

        renderer.unload()
        assert renderer.is_loaded is False
        assert renderer.font_path is None


class TestFindSystemFont:
    """Tests for font discovery."""

    def test_find_monospace(self):
        """Find a monospace font."""
        path = find_system_font("monospace")
        # May or may not exist
        if path:
            assert os.path.exists(path)
            assert path.endswith((".ttf", ".otf", ".TTF", ".OTF"))

    def test_find_by_name(self):
        """Find font by name pattern."""
        # Try to find DejaVu (common on Linux)
        path = find_system_font("DejaVu")
        if path:
            assert "DejaVu" in path or "dejavu" in path.lower()

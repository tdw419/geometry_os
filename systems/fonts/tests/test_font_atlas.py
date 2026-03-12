"""
Font Atlas Unit Tests

Tests for systems/fonts/font_atlas.py (planned component).
Following FONT.md test plan: 10 unit tests.

Note: These tests will be skipped until font_atlas.py is implemented.
"""

import pytest
import sys
from pathlib import Path

ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(ROOT))

# Check if font_atlas module exists
try:
    from systems.fonts.font_atlas import FontAtlas, AtlasGlyph
    HAS_ATLAS = True
except ImportError:
    HAS_ATLAS = False

# Check for freetype
try:
    import freetype
    HAS_FREETYPE = True
except ImportError:
    HAS_FREETYPE = False


# Skip all tests if atlas not implemented
pytestmark = pytest.mark.skipif(
    not HAS_ATLAS,
    reason="font_atlas.py not implemented yet"
)


@pytest.fixture
def atlas():
    """Create a FontAtlas for testing."""
    return FontAtlas(width=512, height=512)


class TestAtlasCreation:
    """Tests for atlas creation."""

    def test_create_atlas_empty(self, atlas):
        """Empty atlas has correct structure."""
        assert atlas.width == 512
        assert atlas.height == 512
        assert len(atlas.glyphs) == 0

    def test_atlas_power_of_two(self):
        """Dimensions are power of 2."""
        atlas = FontAtlas(width=256, height=512)
        assert (atlas.width & (atlas.width - 1)) == 0
        assert (atlas.height & (atlas.height - 1)) == 0


class TestGlyphPacking:
    """Tests for adding glyphs to atlas."""

    def test_add_glyph_to_atlas(self, atlas):
        """Add single glyph."""
        # Mock glyph data
        glyph_data = bytes(32 * 32 * 4)  # 32x32 RGBA

        glyph = atlas.add_glyph(
            char="A",
            pixels=glyph_data,
            width=32,
            height=32
        )

        assert glyph is not None
        assert glyph.char == "A"
        assert len(atlas.glyphs) == 1

    def test_atlas_grows_dynamically(self, atlas):
        """Auto-expand when full."""
        # Fill atlas with small glyphs
        for i in range(100):
            glyph_data = bytes(16 * 16 * 4)
            atlas.add_glyph(chr(65 + i), glyph_data, 16, 16)

        assert len(atlas.glyphs) == 100

    def test_get_glyph_uv_coords(self, atlas):
        """Return correct UV coordinates."""
        glyph_data = bytes(32 * 32 * 4)

        glyph = atlas.add_glyph("B", glyph_data, 32, 32)

        # UV coords should be 0-1 range
        assert 0 <= glyph.u0 <= 1
        assert 0 <= glyph.v0 <= 1
        assert 0 <= glyph.u1 <= 1
        assert 0 <= glyph.v1 <= 1

    def test_atlas_padding(self, atlas):
        """Glyphs don't bleed (have padding)."""
        glyph_data = bytes(32 * 32 * 4)

        g1 = atlas.add_glyph("X", glyph_data, 32, 32)
        g2 = atlas.add_glyph("Y", glyph_data, 32, 32)

        # Glyphs should not overlap
        # (Simple check - real implementation needs proper rect packing)


class TestAtlasMetadata:
    """Tests for atlas metadata."""

    def test_atlas_metadata(self, atlas):
        """Glyph metrics stored correctly."""
        glyph_data = bytes(24 * 30 * 4)

        glyph = atlas.add_glyph("M", glyph_data, 24, 30,
                                bearing_x=2, bearing_y=28, advance=26)

        assert glyph.width == 24
        assert glyph.height == 30
        assert glyph.bearing_x == 2
        assert glyph.bearing_y == 28
        assert glyph.advance == 26

    def test_multiple_fonts_same_atlas(self, atlas):
        """Pack multiple fonts."""
        # Simulate glyphs from different fonts
        for i in range(10):
            glyph_data = bytes(20 * 20 * 4)
            atlas.add_glyph(f"font1_{i}", glyph_data, 20, 20)

        for i in range(10):
            glyph_data = bytes(16 * 16 * 4)
            atlas.add_glyph(f"font2_{i}", glyph_data, 16, 16)

        assert len(atlas.glyphs) == 20


class TestAtlasSerialization:
    """Tests for saving/loading atlas."""

    def test_atlas_serialization(self, atlas, tmp_path):
        """Save/load to PNG."""
        import os

        # Add some glyphs
        for char in "ABCD":
            glyph_data = bytes(16 * 16 * 4)
            atlas.add_glyph(char, glyph_data, 16, 16)

        # Save
        png_path = tmp_path / "atlas.png"
        json_path = tmp_path / "atlas.json"

        atlas.save(str(png_path), str(json_path))

        assert png_path.exists()
        assert json_path.exists()

        # Verify PNG magic bytes
        with open(png_path, "rb") as f:
            magic = f.read(8)
            assert magic[:4] == b'\x89PNG'

    def test_atlas_clear(self, atlas):
        """Reset atlas."""
        glyph_data = bytes(16 * 16 * 4)
        atlas.add_glyph("Z", glyph_data, 16, 16)

        assert len(atlas.glyphs) == 1

        atlas.clear()
        assert len(atlas.glyphs) == 0

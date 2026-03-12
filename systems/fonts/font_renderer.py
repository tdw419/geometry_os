"""
Font Renderer - FreeType wrapper for Geometry OS

Uses real FreeType library via freetype-py.
No toy implementations - renders actual glyphs from real font files.

Architecture:
- FreeType for font parsing and glyph rasterization
- LRU cache for rendered glyphs
- RGBA output for compositor integration

Usage:
    from systems.fonts.font_renderer import FontRenderer

    renderer = FontRenderer()
    renderer.load("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf", size=14)
    pixels, width, height = renderer.render_text("Hello")
"""

import time
from pathlib import Path
from typing import Optional, Tuple, Dict, Any
from dataclasses import dataclass
from functools import lru_cache
import struct
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    import freetype

try:
    import freetype

    HAS_FREETYPE = True
except ImportError:
    HAS_FREETYPE = False
    freetype = None


@dataclass
class GlyphMetrics:
    """Metrics for a single rendered glyph."""

    char: str
    width: int
    height: int
    bearing_x: int
    bearing_y: int
    advance_x: int
    advance_y: int


@dataclass
class TextMetrics:
    """Metrics for rendered text string."""

    width: int
    height: int
    baseline: int


class FontRenderer:
    """
    FreeType-based font renderer for Geometry OS.

    Uses real FreeType library - no stubs or toy implementations.
    All operations verify actual output.

    Example:
        >>> renderer = FontRenderer()
        >>> renderer.load("/path/to/font.ttf", size=14)
        >>> pixels, w, h = renderer.render_text("Hello")
        >>> assert len(pixels) == w * h * 4  # RGBA
    """

    def __init__(self, cache_size: int = 1024):
        """
        Initialize font renderer.

        Args:
            cache_size: Maximum number of cached glyphs
        """
        if not HAS_FREETYPE:
            raise RuntimeError("freetype-py not installed. Install with: pip install freetype-py")

        self._face: Optional["freetype.Face"] = None
        self._font_path: Optional[str] = None
        self._size: int = 0
        self._cache_size = cache_size
        self._glyph_cache: Dict[str, Any] = {}

        # Metrics
        self._load_time_ms: float = 0
        self._render_count: int = 0
        self._cache_hits: int = 0
        self._cache_misses: int = 0

    @property
    def is_loaded(self) -> bool:
        """Check if a font is loaded."""
        return self._face is not None

    @property
    def font_path(self) -> Optional[str]:
        """Get path of loaded font."""
        return self._font_path

    @property
    def font_size(self) -> int:
        """Get current font size in pixels."""
        return self._size

    @property
    def family_name(self) -> Optional[str]:
        """Get font family name."""
        if self._face:
            return (
                self._face.family_name.decode("utf-8")
                if isinstance(self._face.family_name, bytes)
                else self._face.family_name
            )
        return None

    @property
    def style_name(self) -> Optional[str]:
        """Get font style name."""
        if self._face:
            return (
                self._face.style_name.decode("utf-8")
                if isinstance(self._face.style_name, bytes)
                else self._face.style_name
            )
        return None

    def load(self, font_path: str, size: int = 14) -> Dict[str, Any]:
        """
        Load a font file and set size.

        Args:
            font_path: Path to TTF/OTF font file
            size: Font size in pixels

        Returns:
            Dict with load status and metrics

        Raises:
            FileNotFoundError: If font file doesn't exist
            RuntimeError: If FreeType fails to load font
        """
        start = time.perf_counter()

        path = Path(font_path)
        if not path.exists():
            raise FileNotFoundError(f"Font file not found: {font_path}")

        try:
            # Load face using FreeType
            self._face = freetype.Face(str(path))
            self._face.set_char_size(size * 64)  # FreeType uses 26.6 fixed point
            self._font_path = str(path)
            self._size = size

            # Clear cache on new font load
            self._glyph_cache.clear()

            elapsed_ms = (time.perf_counter() - start) * 1000
            self._load_time_ms = elapsed_ms

            return {
                "success": True,
                "font_path": self._font_path,
                "size": self._size,
                "family_name": self.family_name,
                "style_name": self.style_name,
                "load_time_ms": round(elapsed_ms, 2),
                "num_glyphs": self._face.num_glyphs if self._face else 0,
            }
        except Exception as e:
            raise RuntimeError(f"Failed to load font {font_path}: {e}")

    def get_glyph_metrics(self, char: str) -> Optional[GlyphMetrics]:
        """
        Get metrics for a single character without rendering.

        Args:
            char: Single character

        Returns:
            GlyphMetrics or None if glyph not found
        """
        if not self._face:
            raise RuntimeError("No font loaded. Call load() first.")

        if len(char) != 1:
            raise ValueError("Expected single character")

        # Load glyph (don't render)
        self._face.load_char(char, freetype.FT_LOAD_DEFAULT | freetype.FT_LOAD_NO_BITMAP)

        glyph = self._face.glyph
        metrics = glyph.metrics

        return GlyphMetrics(
            char=char,
            width=metrics.width // 64,
            height=metrics.height // 64,
            bearing_x=metrics.horiBearingX // 64,
            bearing_y=metrics.horiBearingY // 64,
            advance_x=metrics.horiAdvance // 64,
            advance_y=0,
        )

    def render_glyph(self, char: str) -> Optional[Tuple[bytes, int, int]]:
        """
        Render a single character to RGBA pixels.

        Args:
            char: Single character

        Returns:
            Tuple of (rgba_bytes, width, height) or None if not renderable
        """
        if not self._face:
            raise RuntimeError("No font loaded. Call load() first.")

        if len(char) != 1:
            raise ValueError("Expected single character")

        # Check cache
        if char in self._glyph_cache:
            self._cache_hits += 1
            return self._glyph_cache[char]

        self._cache_misses += 1

        # Load and render glyph
        self._face.load_char(char, freetype.FT_LOAD_RENDER)

        bitmap = self._face.glyph.bitmap
        width = bitmap.width
        height = bitmap.rows

        if width == 0 or height == 0:
            # Space or non-renderable character
            return None

        # Convert grayscale to RGBA
        # FreeType renders to 8-bit grayscale
        gray_pixels = bitmap.buffer
        rgba = bytearray(width * height * 4)

        for i, gray in enumerate(gray_pixels):
            rgba[i * 4 + 0] = 255  # R
            rgba[i * 4 + 1] = 255  # G
            rgba[i * 4 + 2] = 255  # B
            rgba[i * 4 + 3] = gray  # A (use grayscale as alpha)

        result = (bytes(rgba), width, height)

        # Cache it
        if len(self._glyph_cache) < self._cache_size:
            self._glyph_cache[char] = result

        return result

    def render_text(self, text: str) -> Tuple[bytes, int, int]:
        """
        Render a text string to RGBA pixels.

        Args:
            text: Text string to render

        Returns:
            Tuple of (rgba_bytes, width, height)
        """
        if not self._face:
            raise RuntimeError("No font loaded. Call load() first.")

        if not text:
            return (b"", 0, 0)

        self._render_count += 1

        # First pass: calculate bounding box
        pen_x = 0
        max_width = 0
        max_top = 0
        max_bottom = 0

        for char in text:
            if char == "\n":
                pen_x = 0
                continue

            self._face.load_char(char, freetype.FT_LOAD_DEFAULT)
            glyph = self._face.glyph

            top = glyph.metrics.horiBearingY // 64
            bottom = (glyph.metrics.height - glyph.metrics.horiBearingY) // 64

            max_top = max(max_top, top)
            max_bottom = max(max_bottom, bottom)

            pen_x += glyph.metrics.horiAdvance // 64
            max_width = max(max_width, pen_x)

        # Handle newlines
        lines = text.split("\n")
        num_lines = len(lines)
        line_height = self._face.size.height // 64
        total_height = max(max_top + max_bottom, line_height) * num_lines

        if max_width == 0 or total_height == 0:
            return (b"", 0, 0)

        # Second pass: render glyphs
        # Create output buffer
        output = bytearray(max_width * total_height * 4)

        pen_x = 0
        pen_y = max_top  # Start from baseline

        for char in text:
            if char == "\n":
                pen_x = 0
                pen_y += line_height
                continue

            # Load glyph
            self._face.load_char(char, freetype.FT_LOAD_RENDER)
            bitmap = self._face.glyph.bitmap

            # Get glyph position
            bitmap_top = self._face.glyph.bitmap_top
            bitmap_left = self._face.glyph.bitmap_left

            # Copy glyph to output
            for row in range(bitmap.rows):
                for col in range(bitmap.width):
                    src_idx = row * bitmap.width + col
                    gray = bitmap.buffer[src_idx]

                    dst_x = pen_x + bitmap_left + col
                    dst_y = pen_y - bitmap_top + row

                    if 0 <= dst_x < max_width and 0 <= dst_y < total_height:
                        dst_idx = (dst_y * max_width + dst_x) * 4
                        output[dst_idx + 0] = 255  # R
                        output[dst_idx + 1] = 255  # G
                        output[dst_idx + 2] = 255  # B
                        output[dst_idx + 3] = gray  # A

            pen_x += self._face.glyph.metrics.horiAdvance // 64

        return (bytes(output), max_width, total_height)

    def get_text_metrics(self, text: str) -> TextMetrics:
        """
        Calculate text dimensions without rendering.

        Args:
            text: Text string

        Returns:
            TextMetrics with width, height, baseline
        """
        if not self._face:
            raise RuntimeError("No font loaded. Call load() first.")

        if not text:
            return TextMetrics(0, 0, 0)

        # Calculate bounding box
        pen_x = 0
        max_width = 0
        max_top = 0

        for char in text:
            if char == "\n":
                pen_x = 0
                continue

            self._face.load_char(char, freetype.FT_LOAD_DEFAULT)
            glyph = self._face.glyph

            top = glyph.metrics.horiBearingY // 64
            max_top = max(max_top, top)

            pen_x += glyph.metrics.horiAdvance // 64
            max_width = max(max_width, pen_x)

        lines = text.split("\n")
        num_lines = len(lines)
        line_height = self._face.size.height // 64
        total_height = line_height * num_lines

        return TextMetrics(
            width=max_width,
            height=total_height,
            baseline=max_top,
        )

    def has_glyph(self, char: str) -> bool:
        """
        Check if font has a glyph for this character.

        Args:
            char: Character to check

        Returns:
            True if glyph exists
        """
        if not self._face:
            raise RuntimeError("No font loaded. Call load() first.")

        if len(char) != 1:
            return False

        # Get glyph index
        charcode = ord(char)
        glyph_index = self._face.get_char_index(charcode)

        return glyph_index != 0

    def get_status(self) -> Dict[str, Any]:
        """
        Get current renderer status.

        Returns:
            Dict with font info and metrics
        """
        return {
            "is_loaded": self.is_loaded,
            "font_path": self._font_path,
            "size": self._size,
            "family_name": self.family_name,
            "style_name": self.style_name,
            "cache_size": self._cache_size,
            "cached_glyphs": len(self._glyph_cache),
            "load_time_ms": round(self._load_time_ms, 2),
            "render_count": self._render_count,
            "cache_hits": self._cache_hits,
            "cache_misses": self._cache_misses,
            "cache_hit_rate": (
                round(self._cache_hits / (self._cache_hits + self._cache_misses) * 100, 1)
                if (self._cache_hits + self._cache_misses) > 0
                else 0
            ),
        }

    def clear_cache(self) -> int:
        """
        Clear glyph cache.

        Returns:
            Number of entries cleared
        """
        count = len(self._glyph_cache)
        self._glyph_cache.clear()
        return count

    def unload(self) -> None:
        """Unload current font."""
        self._face = None
        self._font_path = None
        self._size = 0
        self._glyph_cache.clear()


def find_system_font(name: str = "monospace") -> Optional[str]:
    """
    Find a system font by name or pattern.

    Args:
        name: Font name or pattern (e.g., "monospace", "sans", "DejaVu")

    Returns:
        Path to font file or None if not found
    """
    import os

    # Common font directories
    font_dirs = [
        "/usr/share/fonts",
        "/usr/local/share/fonts",
        os.path.expanduser("~/.local/share/fonts"),
        os.path.expanduser("~/.fonts"),
    ]

    # Map generic names to patterns
    patterns = {
        "monospace": ["Mono", "mono", "Courier", "Fixed"],
        "sans": ["Sans", "sans", "Arial", "Helvetica"],
        "serif": ["Serif", "serif", "Times", "Georgia"],
    }

    search_patterns = patterns.get(name.lower(), [name])

    for font_dir in font_dirs:
        if not os.path.exists(font_dir):
            continue

        for root, dirs, files in os.walk(font_dir):
            for file in files:
                if file.endswith((".ttf", ".otf", ".TTF", ".OTF")):
                    for pattern in search_patterns:
                        if pattern in file:
                            return os.path.join(root, file)

    return None

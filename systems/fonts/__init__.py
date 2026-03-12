"""
Geometry OS Font System

Provides font loading and rendering using FreeType.

Components:
- font_renderer: FreeType wrapper for glyph rendering
- cli: Agent-controllable CLI interface
- font_atlas: GPU-ready glyph atlas generation (planned)
- font_cache: LRU cache for rendered glyphs (planned)
"""

from systems.fonts.font_renderer import (
    FontRenderer,
    GlyphMetrics,
    TextMetrics,
    find_system_font,
)

__all__ = [
    'FontRenderer',
    'GlyphMetrics',
    'TextMetrics',
    'find_system_font',
]

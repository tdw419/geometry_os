#!/usr/bin/env python3
"""
Bitmap Font Module — 8x8 Pixel Glyph Maps

Each character = 8 bytes, each byte = one row of 8 pixels.
Bit 7 (MSB) = leftmost pixel, Bit 0 = rightmost pixel.

Usage:
    font = BitmapFont8x8()
    font.render_string(buffer, "Hello", x=10, y=10, color=Color.RED)

Self-hosting path:
    Once we can render text → show code → build terminal → recompile OS live.
    Syntax highlighting = direct memory writes (different colors for tokens).
"""

from __future__ import annotations
from dataclasses import dataclass
from typing import Dict, List, Optional

# =============================================================================
# 8x8 BITMAP FONT DATA
# =============================================================================

# Each entry: char -> 8 bytes (one per row, MSB=left)
FONT_8X8: Dict[int, List[int]] = {
    # Space (0x20)
    0x20: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
    # ! (0x21)
    0x21: [0x18, 0x18, 0x18, 0x18, 0x18, 0x00, 0x18, 0x00],
    # " (0x22)
    0x22: [0x6C, 0x6C, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00],
    # # (0x23)
    0x23: [0x6C, 0x6C, 0xFE, 0x6C, 0xFE, 0x6C, 0x6C, 0x00],
    # $ (0x24)
    0x24: [0x18, 0x7E, 0xC0, 0x7C, 0x06, 0xFC, 0x18, 0x00],
    # % (0x25)
    0x25: [0xC6, 0xCC, 0x18, 0x30, 0x60, 0xC6, 0x86, 0x00],
    # & (0x26)
    0x26: [0x38, 0x6C, 0x38, 0x76, 0xDC, 0xCC, 0x76, 0x00],
    # ' (0x27)
    0x27: [0x18, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00],
    # ( (0x28)
    0x28: [0x0C, 0x18, 0x30, 0x30, 0x30, 0x18, 0x0C, 0x00],
    # ) (0x29)
    0x29: [0x30, 0x18, 0x0C, 0x0C, 0x0C, 0x18, 0x30, 0x00],
    # * (0x2A)
    0x2A: [0x00, 0x66, 0x3C, 0xFF, 0x3C, 0x66, 0x00, 0x00],
    # + (0x2B)
    0x2B: [0x00, 0x18, 0x18, 0x7E, 0x18, 0x18, 0x00, 0x00],
    # , (0x2C)
    0x2C: [0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x30],
    # - (0x2D)
    0x2D: [0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x00],
    # . (0x2E)
    0x2E: [0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00],
    # / (0x2F)
    0x2F: [0x06, 0x0C, 0x18, 0x30, 0x60, 0xC0, 0x80, 0x00],
    # 0-9 (0x30-0x39)
    0x30: [0x7C, 0xC6, 0xCE, 0xD6, 0xE6, 0xC6, 0x7C, 0x00],
    0x31: [0x18, 0x38, 0x18, 0x18, 0x18, 0x18, 0x7E, 0x00],
    0x32: [0x7C, 0xC6, 0x06, 0x1C, 0x30, 0x66, 0xFE, 0x00],
    0x33: [0x7C, 0xC6, 0x06, 0x3C, 0x06, 0xC6, 0x7C, 0x00],
    0x34: [0x1C, 0x3C, 0x6C, 0xCC, 0xFE, 0x0C, 0x1E, 0x00],
    0x35: [0xFE, 0xC0, 0xC0, 0xFC, 0x06, 0xC6, 0x7C, 0x00],
    0x36: [0x38, 0x60, 0xC0, 0xFC, 0xC6, 0xC6, 0x7C, 0x00],
    0x37: [0xFE, 0xC6, 0x0C, 0x18, 0x30, 0x30, 0x30, 0x00],
    0x38: [0x7C, 0xC6, 0xC6, 0x7C, 0xC6, 0xC6, 0x7C, 0x00],
    0x39: [0x7C, 0xC6, 0xC6, 0x7E, 0x06, 0x0C, 0x78, 0x00],
    # : (0x3A)
    0x3A: [0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x00],
    # ; (0x3B)
    0x3B: [0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x30],
    # < (0x3C)
    0x3C: [0x06, 0x0C, 0x18, 0x30, 0x18, 0x0C, 0x06, 0x00],
    # = (0x3D)
    0x3D: [0x00, 0x00, 0x7E, 0x00, 0x00, 0x7E, 0x00, 0x00],
    # > (0x3E)
    0x3E: [0x60, 0x30, 0x18, 0x0C, 0x18, 0x30, 0x60, 0x00],
    # ? (0x3F)
    0x3F: [0x7C, 0xC6, 0x0C, 0x18, 0x18, 0x00, 0x18, 0x00],
    # @ (0x40)
    0x40: [0x7C, 0xC6, 0xDE, 0xDE, 0xDE, 0xC0, 0x78, 0x00],
    # A-Z (0x41-0x5A)
    0x41: [0x38, 0x6C, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0x00],  # A
    0x42: [0xFC, 0x66, 0x66, 0x7C, 0x66, 0x66, 0xFC, 0x00],  # B
    0x43: [0x3C, 0x66, 0xC0, 0xC0, 0xC0, 0x66, 0x3C, 0x00],  # C
    0x44: [0xF8, 0x6C, 0x66, 0x66, 0x66, 0x6C, 0xF8, 0x00],  # D
    0x45: [0xFE, 0x62, 0x68, 0x78, 0x68, 0x62, 0xFE, 0x00],  # E
    0x46: [0xFE, 0x62, 0x68, 0x78, 0x68, 0x60, 0xF0, 0x00],  # F
    0x47: [0x3C, 0x66, 0xC0, 0xC0, 0xCE, 0x66, 0x3A, 0x00],  # G
    0x48: [0xC6, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0xC6, 0x00],  # H
    0x49: [0x3C, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00],  # I
    0x4A: [0x1E, 0x0C, 0x0C, 0x0C, 0xCC, 0xCC, 0x78, 0x00],  # J
    0x4B: [0xE6, 0x66, 0x6C, 0x78, 0x6C, 0x66, 0xE6, 0x00],  # K
    0x4C: [0xF0, 0x60, 0x60, 0x60, 0x62, 0x66, 0xFE, 0x00],  # L
    0x4D: [0xC6, 0xEE, 0xFE, 0xFE, 0xD6, 0xC6, 0xC6, 0x00],  # M
    0x4E: [0xC6, 0xE6, 0xF6, 0xDE, 0xCE, 0xC6, 0xC6, 0x00],  # N
    0x4F: [0x7C, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00],  # O
    0x50: [0xFC, 0x66, 0x66, 0x7C, 0x60, 0x60, 0xF0, 0x00],  # P
    0x51: [0x7C, 0xC6, 0xC6, 0xC6, 0xC6, 0xCE, 0x7C, 0x0E],  # Q
    0x52: [0xFC, 0x66, 0x66, 0x7C, 0x6C, 0x66, 0xE6, 0x00],  # R
    0x53: [0x7C, 0xC6, 0x60, 0x38, 0x0C, 0xC6, 0x7C, 0x00],  # S
    0x54: [0x7E, 0x7E, 0x5A, 0x18, 0x18, 0x18, 0x3C, 0x00],  # T
    0x55: [0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00],  # U
    0x56: [0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x00],  # V
    0x57: [0xC6, 0xC6, 0xC6, 0xD6, 0xFE, 0xEE, 0xC6, 0x00],  # W
    0x58: [0xC6, 0xC6, 0x6C, 0x38, 0x6C, 0xC6, 0xC6, 0x00],  # X
    0x59: [0x66, 0x66, 0x66, 0x3C, 0x18, 0x18, 0x3C, 0x00],  # Y
    0x5A: [0xFE, 0xC6, 0x8C, 0x18, 0x32, 0x66, 0xFE, 0x00],  # Z
    # [ (0x5B)
    0x5B: [0x3C, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x00],
    # \ (0x5C)
    0x5C: [0xC0, 0x60, 0x30, 0x18, 0x0C, 0x06, 0x02, 0x00],
    # ] (0x5D)
    0x5D: [0x3C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x3C, 0x00],
    # ^ (0x5E)
    0x5E: [0x10, 0x38, 0x6C, 0xC6, 0x00, 0x00, 0x00, 0x00],
    # _ (0x5F)
    0x5F: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF],
    # ` (0x60)
    0x60: [0x30, 0x18, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00],
    # a-z (0x61-0x7A)
    0x61: [0x00, 0x00, 0x78, 0x0C, 0x7C, 0xCC, 0x76, 0x00],  # a
    0x62: [0xE0, 0x60, 0x60, 0x7C, 0x66, 0x66, 0xDC, 0x00],  # b
    0x63: [0x00, 0x00, 0x78, 0xCC, 0xC0, 0xCC, 0x78, 0x00],  # c
    0x64: [0x1C, 0x0C, 0x0C, 0x7C, 0xCC, 0xCC, 0x76, 0x00],  # d
    0x65: [0x00, 0x00, 0x78, 0xCC, 0xFC, 0xC0, 0x78, 0x00],  # e
    0x66: [0x38, 0x6C, 0x64, 0xF0, 0x60, 0x60, 0xF0, 0x00],  # f
    0x67: [0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0xF8],  # g
    0x68: [0xE0, 0x60, 0x6C, 0x76, 0x66, 0x66, 0xE6, 0x00],  # h
    0x69: [0x18, 0x00, 0x38, 0x18, 0x18, 0x18, 0x3C, 0x00],  # i
    0x6A: [0x06, 0x00, 0x06, 0x06, 0x06, 0x66, 0x66, 0x3C],  # j
    0x6B: [0xE0, 0x60, 0x66, 0x6C, 0x78, 0x6C, 0xE6, 0x00],  # k
    0x6C: [0x38, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00],  # l
    0x6D: [0x00, 0x00, 0xEC, 0xFE, 0xD6, 0xD6, 0xD6, 0x00],  # m
    0x6E: [0x00, 0x00, 0xDC, 0x66, 0x66, 0x66, 0x66, 0x00],  # n
    0x6F: [0x00, 0x00, 0x78, 0xCC, 0xCC, 0xCC, 0x78, 0x00],  # o
    0x70: [0x00, 0x00, 0xDC, 0x66, 0x66, 0x7C, 0x60, 0xF0],  # p
    0x71: [0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0x1E],  # q
    0x72: [0x00, 0x00, 0xDC, 0x76, 0x60, 0x60, 0xF0, 0x00],  # r
    0x73: [0x00, 0x00, 0x7C, 0xC0, 0x70, 0x1C, 0xF8, 0x00],  # s
    0x74: [0x30, 0x30, 0xFC, 0x30, 0x30, 0x34, 0x18, 0x00],  # t
    0x75: [0x00, 0x00, 0xCC, 0xCC, 0xCC, 0xCC, 0x76, 0x00],  # u
    0x76: [0x00, 0x00, 0xCC, 0xCC, 0xCC, 0x78, 0x30, 0x00],  # v
    0x77: [0x00, 0x00, 0xC6, 0xD6, 0xD6, 0xFE, 0x6C, 0x00],  # w
    0x78: [0x00, 0x00, 0xC6, 0x6C, 0x38, 0x6C, 0xC6, 0x00],  # x
    0x79: [0x00, 0x00, 0xCC, 0xCC, 0xCC, 0x7C, 0x0C, 0xF8],  # y
    0x7A: [0x00, 0x00, 0xFC, 0x98, 0x30, 0x64, 0xFC, 0x00],  # z
    # { (0x7B)
    0x7B: [0x0E, 0x18, 0x18, 0x70, 0x18, 0x18, 0x0E, 0x00],
    # | (0x7C)
    0x7C: [0x18, 0x18, 0x18, 0x00, 0x18, 0x18, 0x18, 0x00],
    # } (0x7D)
    0x7D: [0x70, 0x18, 0x18, 0x0E, 0x18, 0x18, 0x70, 0x00],
    # ~ (0x7E)
    0x7E: [0x76, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
    # ======================================================================
    # SPATIAL TOKENS (0x80-0x8F) — Geometry Standard
    # ======================================================================
    # 0x80: DOT — Single pixel marker
    0x80: [0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00],
    # 0x81: CIRCLE — Agent avatar / node
    0x81: [0x1E, 0x3C, 0x66, 0x66, 0x66, 0x3C, 0x1E, 0x00],
    # 0x82: SQUARE — Container / boundary
    0x82: [0x7E, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7E, 0x00],
    # 0x83: TRIANGLE — Direction / hierarchy
    0x83: [0x18, 0x3C, 0x66, 0xAA, 0xAA, 0xFE, 0xFE, 0x00],
    # 0x84: RECT — Rectangle block (roadmap milestone)
    0x84: [0xFE, 0xC2, 0xC2, 0xC2, 0xC2, 0xC2, 0xFE, 0x00],
    # 0x85: ARROW_RIGHT — Flow / transition
    0x85: [0x18, 0x3C, 0x7E, 0x66, 0x42, 0x42, 0x42, 0x00],
    # 0x86: ARROW_LEFT — Back / return
    0x86: [0x18, 0x1C, 0x3E, 0x66, 0xC6, 0xC6, 0xC6, 0x00],
    # 0x87: ARROW_UP — Ascend / promote
    0x87: [0x1C, 0x3E, 0x7F, 0x18, 0x18, 0x18, 0x18, 0x00],
    # 0x88: ARROW_DOWN — Descend / demote
    0x88: [0x18, 0x18, 0x18, 0x18, 0x7F, 0x3E, 0x1C, 0x00],
    # 0x89: CROSS — Delete / cancel
    0x89: [0x42, 0x24, 0x18, 0x18, 0x18, 0x24, 0x42, 0x00],
    # 0x8A: PLUS — Add / create
    0x8A: [0x18, 0x18, 0x18, 0x7E, 0x18, 0x18, 0x18, 0x00],
    # 0x8B: STAR — Important / highlight
    0x8B: [0x24, 0x6C, 0xFF, 0xFF, 0x3E, 0x6C, 0x24, 0x00],
    # 0x8C: HEART — Security validated (entropic heartbeat)
    0x8C: [0x18, 0x3C, 0x7E, 0x66, 0x3C, 0x18, 0x00, 0x00],
    # 0x8D: LIGHTNING — Power / compute spike
    0x8D: [0x3C, 0x7E, 0x06, 0x06, 0x42, 0x7E, 0x3C, 0x00],
    # 0x8E: EYE — Watch / observe mode
    0x8E: [0x1E, 0x3C, 0x6A, 0x54, 0x6A, 0x3C, 0x1E, 0x00],
    # 0x8F: LOCK — Security / write quarantine
    0x8F: [0x7E, 0xC6, 0xFE, 0xC2, 0xC4, 0xF8, 0xC4, 0x00],
}

# Default glyph for unknown characters
DEFAULT_GLYPH = [0xFF, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0xFF]  # Square box


# =============================================================================
# BITMAP FONT CLASS
# =============================================================================


@dataclass
class Color:
    """Simple color class."""

    r: int
    g: int
    b: int
    a: int = 255

    @classmethod
    def from_hex(cls, hex_str: str) -> "Color":
        h = hex_str.strip().lstrip("#")
        if len(h) == 3:
            h = h[0] * 2 + h[1] * 2 + h[2] * 2
        return cls(int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16))

    # Presets for syntax highlighting
    WHITE = None  # Set below
    GREEN = None
    CYAN = None
    YELLOW = None
    RED = None
    MAGENTA = None
    BLUE = None
    ORANGE = None
    GRAY = None


Color.WHITE = Color(255, 255, 255)
Color.GREEN = Color(0, 255, 0)
Color.CYAN = Color(0, 255, 255)
Color.YELLOW = Color(255, 255, 0)
Color.RED = Color(255, 0, 0)
Color.MAGENTA = Color(255, 0, 255)
Color.BLUE = Color(0, 128, 255)
Color.ORANGE = Color(255, 128, 0)
Color.GRAY = Color(128, 128, 128)


class BitmapFont8x8:
    """
    8x8 bitmap font renderer.

    Each character is 8 pixels wide × 8 pixels tall.
    Bit 7 (MSB) of each byte = leftmost pixel.
    """

    CHAR_WIDTH = 8
    CHAR_HEIGHT = 8

    def __init__(self, custom_glyphs: Optional[Dict[int, List[int]]] = None):
        """
        Initialize font with optional custom glyphs.

        Args:
            custom_glyphs: Dict mapping char codes to 8-byte glyph data
        """
        self._glyphs = dict(FONT_8X8)
        if custom_glyphs:
            self._glyphs.update(custom_glyphs)

    def get_glyph(self, char: str | int) -> List[int]:
        """
        Get glyph data for a character.

        Args:
            char: Character (str of length 1) or ASCII code (int)

        Returns:
            List of 8 bytes representing the glyph bitmap
        """
        code = ord(char) if isinstance(char, str) else char
        return self._glyphs.get(code, DEFAULT_GLYPH)

    def set_glyph(self, char: str | int, data: List[int]) -> None:
        """Set custom glyph for a character."""
        code = ord(char) if isinstance(char, str) else char
        if len(data) != 8:
            raise ValueError("Glyph must be exactly 8 bytes")
        self._glyphs[code] = data

    def render_char(
        self,
        buffer: "FrameBuffer",
        char: str | int,
        x: int,
        y: int,
        color: Color,
        bg: Optional[Color] = None,
    ) -> None:
        """
        Render a single character to the frame buffer.

        Args:
            buffer: Frame buffer to render to
            char: Character to render
            x, y: Top-left position in pixels
            color: Foreground color
            bg: Optional background color (None = transparent)
        """
        glyph = self.get_glyph(char)

        for row in range(8):
            row_data = glyph[row]
            for col in range(8):
                px = x + col
                py = y + row

                # Check if bit is set (MSB = leftmost)
                if row_data & (0x80 >> col):
                    buffer.set_pixel(px, py, color)
                elif bg:
                    buffer.set_pixel(px, py, bg)

    def render_string(
        self,
        buffer: "FrameBuffer",
        text: str,
        x: int,
        y: int,
        color: Color,
        bg: Optional[Color] = None,
        spacing: int = 0,
    ) -> int:
        """
        Render a string to the frame buffer.

        Args:
            buffer: Frame buffer to render to
            text: String to render
            x, y: Top-left position in pixels
            color: Foreground color
            bg: Optional background color
            spacing: Extra pixels between characters

        Returns:
            X position after the last character (for chaining)
        """
        cx = x
        char_width = self.CHAR_WIDTH + spacing

        for char in text:
            if char == "\n":
                cx = x
                y += self.CHAR_HEIGHT
            elif char == "\t":
                cx = ((cx - x) // 32 + 1) * 32 + x  # Tab to 32px boundary
            else:
                self.render_char(buffer, char, cx, y, color, bg)
                cx += char_width

        return cx

    def measure(self, text: str, spacing: int = 0) -> tuple[int, int]:
        """
        Measure the size of rendered text.

        Returns:
            (width, height) in pixels
        """
        lines = text.split("\n")
        max_width = max(len(line) for line in lines) * (self.CHAR_WIDTH + spacing)
        height = len(lines) * self.CHAR_HEIGHT
        return (max_width, height)


# =============================================================================
# FRAME BUFFER (Minimal for font demo)
# =============================================================================


class FrameBuffer:
    """Minimal frame buffer for text rendering."""

    def __init__(self, width: int = 1920, height: int = 1088):
        self.width = width
        self.height = height
        self._pixels: Dict[tuple[int, int], Color] = {}
        self._background = Color(0, 0, 0)

    def clear(self, color: Optional[Color] = None) -> None:
        self._pixels.clear()
        if color:
            self._background = color

    def set_pixel(self, x: int, y: int, color: Color) -> None:
        if 0 <= x < self.width and 0 <= y < self.height:
            self._pixels[(x, y)] = color

    def get_pixel(self, x: int, y: int) -> Color:
        return self._pixels.get((x, y), self._background)

    def to_hex_grid(self) -> List[List[str]]:
        """Export as grid of hex strings."""
        grid = []
        for y in range(self.height):
            row = []
            for x in range(self.width):
                c = self.get_pixel(x, y)
                row.append(f"{c.r:02X}{c.g:02X}{c.b:02X}")
            grid.append(row)
        return grid


# =============================================================================
# SYNTAX HIGHLIGHTER
# =============================================================================


class SyntaxHighlighter:
    """
    Simple syntax highlighter for code.

    Token types → Colors for direct memory writes.
    """

    # Keywords (Python-like)
    KEYWORDS = {
        "def",
        "class",
        "if",
        "else",
        "elif",
        "for",
        "while",
        "return",
        "import",
        "from",
        "as",
        "try",
        "except",
        "finally",
        "with",
        "True",
        "False",
        "None",
        "and",
        "or",
        "not",
        "in",
        "is",
        "lambda",
        "yield",
        "global",
        "nonlocal",
        "pass",
        "break",
        "continue",
        "raise",
        "assert",
        "async",
        "await",
        # Rust-like
        "fn",
        "let",
        "mut",
        "const",
        "struct",
        "enum",
        "impl",
        "pub",
        "use",
        "mod",
        "self",
        "super",
        "where",
        "match",
        "loop",
    }

    # Builtins
    BUILTINS = {
        "print",
        "len",
        "range",
        "str",
        "int",
        "float",
        "list",
        "dict",
        "open",
        "read",
        "write",
        "append",
        "extend",
        "pop",
        "get",
    }

    @classmethod
    def highlight_line(cls, line: str) -> List[tuple[str, Color]]:
        """
        Highlight a line of code.

        Returns:
            List of (text, color) tuples
        """
        tokens = cls._tokenize(line)
        result = []

        for token in tokens:
            color = cls._get_color(token)
            result.append((token, color))

        return result

    @staticmethod
    def _tokenize(line: str) -> List[str]:
        """Simple tokenizer - split on whitespace and punctuation."""
        import re

        return re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*|[0-9]+|"[^"]*"|\'[^\']*\'|[^\s\w]', line)

    @classmethod
    def _get_color(cls, token: str) -> Color:
        """Determine color for a token."""
        # Comments
        if token.startswith("#"):
            return Color.GRAY

        # Strings
        if token.startswith('"') or token.startswith("'"):
            return Color.GREEN

        # Numbers
        if token.isdigit():
            return Color.CYAN

        # Keywords
        if token in cls.KEYWORDS:
            return Color.MAGENTA

        # Builtins
        if token in cls.BUILTINS:
            return Color.YELLOW

        # Punctuation
        if token in "()[]{}:,.;":
            return Color.WHITE

        # Operators
        if token in "+-*/%=<>!&|^~":
            return Color.RED

        # Default
        return Color.WHITE


# =============================================================================
# TEXT RENDERER (High-Level)
# =============================================================================


class TextRenderer:
    """
    High-level text renderer with syntax highlighting support.
    """

    def __init__(self, font: Optional[BitmapFont8x8] = None):
        self.font = font or BitmapFont8x8()

    def render_text(
        self,
        buffer: FrameBuffer,
        text: str,
        x: int,
        y: int,
        color: Color = Color.WHITE,
        bg: Optional[Color] = None,
    ) -> int:
        """Render plain text."""
        return self.font.render_string(buffer, text, x, y, color, bg)

    def render_code(
        self, buffer: FrameBuffer, code: str, x: int, y: int, line_height: int = 10
    ) -> int:
        """
        Render code with syntax highlighting.

        Returns:
            Y position after last line
        """
        cy = y
        for line in code.split("\n"):
            tokens = SyntaxHighlighter.highlight_line(line)
            cx = x

            for token, color in tokens:
                cx = self.font.render_string(buffer, token, cx, cy, color)
                cx = self.font.render_string(buffer, " ", cx, cy, Color.WHITE)

            cy += line_height

        return cy

    def render_terminal(
        self,
        buffer: FrameBuffer,
        lines: List[str],
        x: int,
        y: int,
        width: int,
        height: int,
        fg: Color = Color.GREEN,
        bg: Color = Color(0, 0, 0),
    ) -> None:
        """
        Render a terminal-style display.

        Args:
            lines: Lines of text to display
            x, y: Top-left position
            width, height: Terminal dimensions in characters
            fg, bg: Foreground and background colors
        """
        # Fill background
        for py in range(y, y + height * 8):
            for px in range(x, x + width * 8):
                buffer.set_pixel(px, py, bg)

        # Render lines
        cy = y
        for i, line in enumerate(lines[:height]):
            self.font.render_string(buffer, line[:width], x, cy, fg)
            cy += 8


# =============================================================================
# DEMO
# =============================================================================


def demo():
    """Demo bitmap font rendering."""
    print("Bitmap Font 8x8 Demo")
    print("=" * 40)

    font = BitmapFont8x8()
    buffer = FrameBuffer(640, 400)

    # Test characters
    test_str = "Hello World 0123456789"
    print(f"\nRendering: '{test_str}'")

    font.render_string(buffer, test_str, 10, 10, Color.WHITE)
    font.render_string(buffer, "The quick brown fox", 10, 30, Color.CYAN)
    font.render_string(buffer, "jumps over the lazy dog", 10, 50, Color.YELLOW)

    # ASCII art demo
    font.render_string(buffer, "+--------+", 10, 80, Color.GREEN)
    font.render_string(buffer, "| GEOMETRY OS |", 10, 90, Color.GREEN)
    font.render_string(buffer, "+--------+", 10, 100, Color.GREEN)

    # Syntax highlighted code
    code = """def hello():
    print("World")
    return 42"""

    renderer = TextRenderer(font)
    renderer.render_code(buffer, code, 10, 130)

    # Show glyph for specific character
    print(f"\nGlyph for 'A' (0x41): {[hex(b) for b in font.get_glyph('A')]}")
    print(f"Glyph for '@' (0x40): {[hex(b) for b in font.get_glyph('@')]}")

    # Measure text
    w, h = font.measure("Hello World")
    print(f"\nText 'Hello World' size: {w}x{h} pixels")

    # Count pixels in buffer
    pixel_count = len(buffer._pixels)
    print(f"Pixels written to buffer: {pixel_count}")

    print("\n✓ Font module ready for scene graph integration")


if __name__ == "__main__":
    demo()

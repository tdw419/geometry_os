#!/usr/bin/env python3
"""
Geometric Terminal Bridge - PixelRTS v3 + Terminal Clone Integration

Bridges the Terminal Clone system with PixelRTS v3 geometric instructions.
This allows terminal output to be "painted" directly as GPU-native pixels.

Terminal Cell Encoding (RGBA):
  R (Char):   ASCII character code (0-127)
  G (FG):     Foreground color index (0-15)
  B (BG):     Background color index (0-15)
  A (Flags):  Style flags (bold=1, dim=2, italic=4, underline=8, blink=16, inverse=32)

Terminal Operation Opcodes (0x40-0x4F):
  0x40 PUTC   - Print character at position
  0x41 MVCR   - Move cursor to (x, y)
  0x42 SCRL   - Scroll by N lines
  0x43 CLR    - Clear screen
  0x44 SETFG  - Set foreground color
  0x45 SETBG  - Set background color

Usage:
    from systems.pixel_compiler.pixelrts_v3.geometric_terminal import GeometricTerminal

    terminal = GeometricTerminal(cols=80, rows=24)
    terminal.putc('H', row=0, col=0, fg=10)  # Bright green 'H'
    terminal.render_to_texture("output.rts.png")
"""

import numpy as np
from PIL import Image
from dataclasses import dataclass
from typing import Optional, Tuple
import math

# Extended Terminal Opcodes
TERMINAL_OPCODES = {
    "PUTC": 0x40,   # Print character
    "MVCR": 0x41,   # Move cursor
    "SCRL": 0x42,   # Scroll
    "CLR":  0x43,   # Clear screen
    "SETFG": 0x44,  # Set foreground
    "SETBG": 0x45,  # Set background
    "CLREOL": 0x46, # Clear to end of line
    "BELL": 0x47,   # Terminal bell
}

# Standard 16-color terminal palette
TERMINAL_COLORS = [
    (0, 0, 0),          # 0: Black
    (194, 54, 33),      # 1: Red
    (37, 188, 36),      # 2: Green
    (173, 172, 58),     # 3: Yellow
    (73, 46, 225),      # 4: Blue
    (211, 56, 211),     # 5: Magenta
    (51, 187, 200),     # 6: Cyan
    (203, 204, 205),    # 7: White
    (129, 131, 131),    # 8: Bright Black
    (252, 57, 31),      # 9: Bright Red
    (49, 231, 34),      # 10: Bright Green
    (234, 236, 35),     # 11: Bright Yellow
    (88, 51, 255),      # 12: Bright Blue
    (249, 53, 248),     # 13: Bright Magenta
    (20, 240, 240),     # 14: Bright Cyan
    (233, 235, 235),    # 15: Bright White
]

@dataclass
class TerminalCell:
    """A single terminal cell with RGBA encoding."""
    char: int = 0      # ASCII code (0-127)
    fg: int = 7        # Foreground color (0-15)
    bg: int = 0        # Background color (0-15)
    flags: int = 0     # Style flags

    def to_rgba(self) -> Tuple[int, int, int, int]:
        """Encode as RGBA pixel for GPU."""
        return (self.char, self.fg, self.bg, self.flags)

    @classmethod
    def from_rgba(cls, rgba: Tuple[int, int, int, int]) -> 'TerminalCell':
        """Decode from RGBA pixel."""
        return cls(char=rgba[0], fg=rgba[1], bg=rgba[2], flags=rgba[3])


class HilbertCurve:
    """Hilbert curve for spatial mapping."""
    def __init__(self, n: int):
        self.n = n

    def d2xy(self, d: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        n = self.n
        x, y = 0, 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return x, y

    def xy2d(self, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        n = self.n
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) > 0 else 0
            ry = 1 if (y & s) > 0 else 0
            d += s * s * ((3 * rx) ^ ry)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            s //= 2
        return d


class GeometricTerminal:
    """
    A terminal that renders to geometric PixelRTS v3 textures.

    Each cell is encoded as an RGBA pixel:
    - R: ASCII character
    - G: Foreground color index
    - B: Background color index
    - A: Style flags
    """

    def __init__(self, cols: int = 80, rows: int = 24, use_hilbert: bool = True):
        self.cols = cols
        self.rows = rows
        self.use_hilbert = use_hilbert

        # Terminal state
        self.cursor_x = 0
        self.cursor_y = 0
        self.fg_color = 7  # Default white
        self.bg_color = 0  # Default black
        self.flags = 0

        # Cell buffer (row-major)
        self.cells: list[list[TerminalCell]] = [
            [TerminalCell() for _ in range(cols)] for _ in range(rows)
        ]

        # Calculate grid size (power of 2 for Hilbert)
        total_cells = cols * rows
        self.grid_size = 1
        while self.grid_size * self.grid_size < total_cells:
            self.grid_size *= 2

        self.hilbert = HilbertCurve(self.grid_size) if use_hilbert else None

    def putc(self, char: str, row: Optional[int] = None, col: Optional[int] = None,
             fg: Optional[int] = None, bg: Optional[int] = None) -> None:
        """Print a character at the specified or current cursor position."""
        if row is not None:
            self.cursor_y = row
        if col is not None:
            self.cursor_x = col

        if 0 <= self.cursor_y < self.rows and 0 <= self.cursor_x < self.cols:
            cell = self.cells[self.cursor_y][self.cursor_x]
            cell.char = ord(char) if len(char) == 1 else 0
            cell.fg = fg if fg is not None else self.fg_color
            cell.bg = bg if bg is not None else self.bg_color
            cell.flags = self.flags

            # Advance cursor
            self.cursor_x += 1
            if self.cursor_x >= self.cols:
                self.cursor_x = 0
                self.cursor_y += 1
                if self.cursor_y >= self.rows:
                    self.scroll(1)
                    self.cursor_y = self.rows - 1

    def puts(self, text: str, row: Optional[int] = None, col: Optional[int] = None) -> None:
        """Print a string starting at the specified position."""
        if row is not None:
            self.cursor_y = row
        if col is not None:
            self.cursor_x = col

        for char in text:
            if char == '\n':
                self.cursor_x = 0
                self.cursor_y += 1
                if self.cursor_y >= self.rows:
                    self.scroll(1)
                    self.cursor_y = self.rows - 1
            elif char == '\r':
                self.cursor_x = 0
            else:
                self.putc(char)

    def move_cursor(self, x: int, y: int) -> None:
        """Move cursor to (x, y) position."""
        self.cursor_x = max(0, min(x, self.cols - 1))
        self.cursor_y = max(0, min(y, self.rows - 1))

    def scroll(self, lines: int = 1) -> None:
        """Scroll the terminal by N lines."""
        for _ in range(lines):
            self.cells.pop(0)
            self.cells.append([TerminalCell() for _ in range(self.cols)])

    def clear(self) -> None:
        """Clear the terminal screen."""
        for row in self.cells:
            for cell in row:
                cell.char = 0
                cell.fg = 7
                cell.bg = 0
                cell.flags = 0
        self.cursor_x = 0
        self.cursor_y = 0

    def set_fg(self, color: int) -> None:
        """Set foreground color."""
        self.fg_color = color & 0xF

    def set_bg(self, color: int) -> None:
        """Set background color."""
        self.bg_color = color & 0xF

    def set_style(self, bold: bool = False, dim: bool = False, italic: bool = False,
                  underline: bool = False, blink: bool = False, inverse: bool = False) -> None:
        """Set text style flags."""
        self.flags = (
            (1 if bold else 0) |
            (2 if dim else 0) |
            (4 if italic else 0) |
            (8 if underline else 0) |
            (16 if blink else 0) |
            (32 if inverse else 0)
        )

    def render_to_texture(self, output_path: str) -> None:
        """Render terminal to PixelRTS v3 texture."""
        img = Image.new('RGBA', (self.grid_size, self.grid_size), (0, 0, 0, 0))
        pixels = img.load()

        for row in range(self.rows):
            for col in range(self.cols):
                cell = self.cells[row][col]

                # Calculate linear index (row-major)
                idx = row * self.cols + col

                if self.use_hilbert and idx < self.grid_size * self.grid_size:
                    x, y = self.hilbert.d2xy(idx)
                else:
                    x = col
                    y = row

                if x < self.grid_size and y < self.grid_size:
                    pixels[x, y] = cell.to_rgba()

        img.save(output_path)
        print(f"Saved geometric terminal to {output_path} ({self.grid_size}x{self.grid_size})")

    def render_to_visual_texture(self, output_path: str, cell_width: int = 8, cell_height: int = 16) -> None:
        """Render terminal to visual PNG (for human viewing, not execution)."""
        width = self.cols * cell_width
        height = self.rows * cell_height

        img = Image.new('RGB', (width, height), TERMINAL_COLORS[0])
        pixels = img.load()

        for row in range(self.rows):
            for col in range(self.cols):
                cell = self.cells[row][cell.col if hasattr(cell, 'col') else col]
                cell = self.cells[row][col]

                # Get colors (handle inverse flag)
                fg_idx = cell.bg if cell.flags & 32 else cell.fg
                bg_idx = cell.fg if cell.flags & 32 else cell.bg

                bg_color = TERMINAL_COLORS[bg_idx]
                fg_color = TERMINAL_COLORS[fg_idx]

                # Fill cell background
                for py in range(cell_height):
                    for px in range(cell_width):
                        x = col * cell_width + px
                        y = row * cell_height + py

                        # Simple font rendering (8x16 bitmap would be better)
                        char_x = px
                        char_y = py

                        # Basic character visualization
                        if cell.char >= 32:
                            # Draw a simple block for the character
                            if char_y < 14 and char_y > 2 and char_x > 0 and char_x < 7:
                                # Simple approximation - show character presence
                                if (char_x + char_y) % 3 == 0:
                                    pixels[x, y] = fg_color
                                else:
                                    pixels[x, y] = bg_color
                            else:
                                pixels[x, y] = bg_color
                        else:
                            pixels[x, y] = bg_color

        img.save(output_path)
        print(f"Saved visual terminal to {output_path} ({width}x{height})")

    def get_cell_at(self, row: int, col: int) -> Optional[TerminalCell]:
        """Get cell at position."""
        if 0 <= row < self.rows and 0 <= col < self.cols:
            return self.cells[row][col]
        return None

    def from_pty_output(self, data: bytes) -> None:
        """
        Process PTY output bytes directly.
        This is the bridge from Terminal Clone's PTY to geometric pixels.
        """
        for byte in data:
            if byte == 0x1b:  # ESC - start of escape sequence
                # Simplified ANSI handling
                pass
            elif byte == ord('\n'):
                self.cursor_x = 0
                self.cursor_y += 1
                if self.cursor_y >= self.rows:
                    self.scroll(1)
                    self.cursor_y = self.rows - 1
            elif byte == ord('\r'):
                self.cursor_x = 0
            elif byte == ord('\t'):
                self.cursor_x = (self.cursor_x + 8) & ~7
            elif 32 <= byte < 127:
                self.putc(chr(byte))
            # Ignore other control characters


def demo():
    """Demonstrate geometric terminal rendering."""
    terminal = GeometricTerminal(cols=40, rows=10)

    # Set colors and print
    terminal.set_fg(10)  # Bright green
    terminal.puts("GEOMETRY OS", row=0, col=14)
    terminal.puts("=" * 40, row=1, col=0)

    terminal.set_fg(14)  # Bright cyan
    terminal.puts("Geometric Terminal v3", row=3, col=10)

    terminal.set_fg(7)  # White
    terminal.puts("Terminal operations as GPU opcodes:", row=5, col=2)

    terminal.set_fg(11)  # Bright yellow
    terminal.puts("  PUTC  0x40 - Print character", row=6, col=2)
    terminal.puts("  MVCR  0x41 - Move cursor", row=7, col=2)
    terminal.puts("  SCRL  0x42 - Scroll", row=8, col=2)

    # Render to geometric texture
    terminal.render_to_texture("geometric_terminal.rts.png")

    print("\nTerminal cells as RGBA pixels:")
    for row in range(min(3, terminal.rows)):
        for col in range(min(10, terminal.cols)):
            cell = terminal.cells[row][col]
            if cell.char > 0:
                print(f"[{chr(cell.char) if 32 <= cell.char < 127 else '?'}:{cell.fg}/{cell.bg}]", end="")
        print()


if __name__ == "__main__":
    demo()

# systems/pixel_brain/atlas_tokenizer.py
"""Atlas Tokenizer for RGB ↔ Index conversion.

This module converts between RGB pixel values and atlas token indices,
enabling PixelBrain to work with a discrete vocabulary (0-1023).
"""

import numpy as np
from typing import List, Tuple, Optional

from systems.pixel_brain.constants import (
    ASCII_START,
    ASCII_END,
    BYTE_LITERAL_START,
    BYTE_LITERAL_END,
    OPCODE_START,
    OPCODE_END,
)
from systems.pixel_brain.hilbert_encoder import HilbertEncoder


def rgb_to_index(r: int, g: int, b: int) -> int:
    """Convert RGB values to a single atlas index (0-1023)."""
    # 10 bits = 2 bits R + 4 bits G + 4 bits B
    r_bits = (int(r) >> 6) & 0x03
    g_bits = (int(g) >> 4) & 0x0F
    b_bits = (int(b) >> 4) & 0x0F
    return (r_bits << 8) | (g_bits << 4) | b_bits


def index_to_rgb(index: int) -> Tuple[int, int, int]:
    """Convert atlas index back to RGB values."""
    r_bits = (index >> 8) & 0x03
    g_bits = (index >> 4) & 0x0F
    b_bits = index & 0x0F
    return (r_bits << 6, g_bits << 4, b_bits << 4)


def ascii_to_index(char: str) -> int:
    """Convert ASCII character to atlas index."""
    if len(char) != 1:
        raise ValueError(f"Expected single character, got '{char}'")
    code = ord(char)
    if not (ASCII_START <= code <= ASCII_END):
        raise ValueError(f"Character '{char}' is not printable ASCII")
    return code


def index_to_ascii(index: int) -> str:
    """Convert atlas index to ASCII character."""
    if not (ASCII_START <= index <= ASCII_END):
        raise ValueError(f"Index {index} is not in ASCII range")
    return chr(index)


def byte_to_index(byte_val: int) -> int:
    """Convert raw byte (0-255) to atlas index (256-511)."""
    if not (0 <= byte_val <= 255):
        raise ValueError(f"Byte value {byte_val} out of range [0, 255]")
    return BYTE_LITERAL_START + byte_val


def index_to_byte(index: int) -> int:
    """Convert atlas index (256-511) back to raw byte."""
    if not (BYTE_LITERAL_START <= index <= BYTE_LITERAL_END):
        raise ValueError(f"Index {index} is not in byte literal range")
    return index - BYTE_LITERAL_START


class AtlasTokenizer:
    """
    Bidirectional tokenizer for Geometry OS Atlas.
    """

    def __init__(self):
        self.encoder = HilbertEncoder(grid_size=256)

    def tokenize_prompt(self, prompt: str) -> List[int]:
        """Convert a string prompt to atlas indices."""
        return [ascii_to_index(c) for c in prompt]

    def detokenize_prompt(self, indices: List[int]) -> str:
        """Convert atlas indices back to string prompt."""
        return "".join([index_to_ascii(i) for i in indices])

    def tokenize_codels(self, codel_array: np.ndarray) -> List[int]:
        """Convert a 2D codel array to indices."""
        h, w, c = codel_array.shape
        indices = []
        for y in range(h):
            for x in range(w):
                r, g, b = codel_array[y, x]
                indices.append(int(rgb_to_index(r, g, b)))
        return indices

    def detokenize_codels(self, indices: List[int], shape: Tuple[int, int]) -> np.ndarray:
        """Convert indices back to a 2D codel array."""
        h, w = shape
        codel_array = np.zeros((h, w, 3), dtype=np.uint8)
        for i, idx in enumerate(indices):
            if i >= h * w: break
            y, x = divmod(i, w)
            codel_array[y, x] = index_to_rgb(idx)
        return codel_array

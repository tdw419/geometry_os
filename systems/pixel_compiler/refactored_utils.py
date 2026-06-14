"""
Refactored utility functions for Geometry OS Pixel Compiler.

This module contains refactored versions of legacy functions with:
- Improved type hints
- Better documentation
- Performance optimizations
- Enhanced error handling
- Reduced cognitive complexity
"""

from __future__ import annotations

import math
from dataclasses import dataclass
from enum import Enum
from pathlib import Path

import numpy as np
from numpy.typing import NDArray

# =============================================================================
# Type Aliases for Clarity
# =============================================================================

ColorRGBA = tuple[int, int, int, int]
Coordinate = tuple[int, int]
Bounds = tuple[int, int, int, int]  # x, y, width, height


# =============================================================================
# Refactored Function 1: Binary Type Detection
# =============================================================================

class BinaryType(Enum):
    """Enumeration of detectable binary file types."""
    GGUF = "gguf"
    SAFE_TENSORS = "safetensors"
    ELF_KERNEL = "elf_kernel"
    WASM = "wasm"
    PE = "pe"
    MACHO = "macho"
    GENERIC_BINARY = "generic"


# Magic byte signatures mapped to binary types
MAGIC_SIGNATURES: dict[bytes, BinaryType] = {
    b"\x00asm": BinaryType.WASM,
    b"\x7fELF\x01": BinaryType.ELF_KERNEL,
    b"\x7fELF\x02": BinaryType.ELF_KERNEL,
    b"MZ": BinaryType.PE,
    b"\xfe\xed\xfa\xce": BinaryType.MACHO,
    b"\xce\xfa\xed\xfe": BinaryType.MACHO,
    b"\xfe\xed\xfa\xcf": BinaryType.MACHO,
    b"\xcf\xfa\xed\xfe": BinaryType.MACHO,
    b"\xca\xfe\xba\xbe": BinaryType.MACHO,
}

# Extension to binary type mapping
EXTENSION_MAP: dict[str, BinaryType] = {
    '.gguf': BinaryType.GGUF,
    '.safetensors': BinaryType.SAFE_TENSORS,
    '.st': BinaryType.SAFE_TENSORS,
    '.wasm': BinaryType.WASM,
    '.exe': BinaryType.PE,
    '.dll': BinaryType.PE,
}


def detect_binary_type(
    path: str | Path,
    read_magic: bytes | None = None
) -> BinaryType:
    """
    Auto-detect binary type from file extension and magic bytes.

    Detection follows a priority order:
    1. File extension (fastest, most reliable for known formats)
    2. Magic bytes (for files without clear extensions)
    3. Default to GENERIC_BINARY if unknown

    Args:
        path: File path to analyze. Can be a real file or just a filename.
        read_magic: Optional pre-read magic bytes. Used when file doesn't
                   exist or for testing.

    Returns:
        BinaryType enum value indicating the detected type.

    Example:
        >>> detect_binary_type("model.gguf")
        <BinaryType.GGUF: 'gguf'>
        >>> detect_binary_type("unknown.bin", read_magic=b"\\x00asm")
        <BinaryType.WASM: 'wasm'>
    """
    path_obj = Path(path)

    # Priority 1: Check file extension (O(1) lookup)
    ext = path_obj.suffix.lower()
    if ext in EXTENSION_MAP:
        return EXTENSION_MAP[ext]

    # Priority 2: Read and check magic bytes
    header = _read_header_bytes(path_obj, read_magic)
    if header is not None:
        for magic, btype in MAGIC_SIGNATURES.items():
            if header.startswith(magic):
                return btype

    # Priority 3: Default fallback
    return BinaryType.GENERIC_BINARY


def _read_header_bytes(
    path: Path,
    fallback: bytes | None = None
) -> bytes | None:
    """
    Safely read the first 8 bytes from a file.

    Args:
        path: Path to the file.
        fallback: Bytes to return if file cannot be read.

    Returns:
        First 8 bytes of the file, fallback bytes, or None.
    """
    if path.exists():
        try:
            with open(path, 'rb') as f:
                return f.read(8)
        except OSError:
            pass

    return fallback


# =============================================================================
# Refactored Function 2-4: Virtual Framebuffer Operations
# =============================================================================

@dataclass
class FramebufferConfig:
    """Configuration for a virtual framebuffer."""
    width: int
    height: int
    channels: int = 4  # RGBA

    @property
    def shape(self) -> tuple[int, int, int]:
        """Return the numpy array shape for this framebuffer."""
        return (self.height, self.width, self.channels)

    @property
    def total_pixels(self) -> int:
        """Return the total number of pixels."""
        return self.width * self.height


class VirtualFramebuffer:
    """
    A virtual framebuffer that stores pixels in a numpy array.

    Simulates GPU framebuffer for testing and virtual display mode.
    Provides efficient pixel manipulation with bounds checking.

    Attributes:
        width: Framebuffer width in pixels.
        height: Framebuffer height in pixels.
        pixels: RGBA pixel data as numpy array (height, width, 4).
    """

    __slots__ = ('_width', '_height', '_pixels')

    def __init__(self, width: int, height: int) -> None:
        """
        Initialize a new virtual framebuffer.

        Args:
            width: Width in pixels.
            height: Height in pixels.

        Raises:
            ValueError: If width or height is non-positive.
        """
        if width <= 0 or height <= 0:
            raise ValueError(f"Dimensions must be positive: {width}x{height}")

        self._width = width
        self._height = height
        self._pixels = np.zeros((height, width, 4), dtype=np.uint8)

    @property
    def width(self) -> int:
        """Framebuffer width in pixels."""
        return self._width

    @property
    def height(self) -> int:
        """Framebuffer height in pixels."""
        return self._height

    @property
    def pixels(self) -> NDArray[np.uint8]:
        """Read-only view of pixel data."""
        return self._pixels.view()

    def _clamp_coordinates(
        self,
        x: int,
        y: int,
        width: int = 1,
        height: int = 1
    ) -> Bounds | None:
        """
        Clamp coordinates to framebuffer bounds.

        Returns None if the region is entirely outside bounds.
        """
        x1 = max(0, x)
        y1 = max(0, y)
        x2 = min(self._width, x + width)
        y2 = min(self._height, y + height)

        if x2 <= x1 or y2 <= y1:
            return None

        return (x1, y1, x2 - x1, y2 - y1)

    def set_pixel(self, x: int, y: int, color: ColorRGBA) -> bool:
        """
        Set a single pixel color.

        Args:
            x: X coordinate.
            y: Y coordinate.
            color: RGBA color tuple (0-255 per channel).

        Returns:
            True if pixel was set, False if coordinates were out of bounds.
        """
        if 0 <= x < self._width and 0 <= y < self._height:
            self._pixels[y, x] = color
            return True
        return False

    def fill_rect(
        self,
        x: int,
        y: int,
        width: int,
        height: int,
        color: ColorRGBA
    ) -> int:
        """
        Fill a rectangle with a color.

        Args:
            x: Starting X coordinate.
            y: Starting Y coordinate.
            width: Rectangle width.
            height: Rectangle height.
            color: RGBA color tuple.

        Returns:
            Number of pixels actually filled.
        """
        bounds = self._clamp_coordinates(x, y, width, height)
        if bounds is None:
            return 0

        x1, y1, w, h = bounds
        self._pixels[y1:y1 + h, x1:x1 + w] = color
        return w * h

    def get_region(
        self,
        x: int,
        y: int,
        width: int,
        height: int
    ) -> NDArray[np.uint8]:
        """
        Get a rectangular region of pixels.

        Args:
            x: Starting X coordinate.
            y: Starting Y coordinate.
            width: Region width.
            height: Region height.

        Returns:
            Copy of the pixel region. Regions outside bounds are filled
            with zeros.
        """
        # Create output array
        result = np.zeros((height, width, 4), dtype=np.uint8)

        bounds = self._clamp_coordinates(x, y, width, height)
        if bounds is None:
            return result

        src_x, src_y, w, h = bounds

        # Calculate destination coordinates
        dst_x = max(0, -x)
        dst_y = max(0, -y)

        result[dst_y:dst_y + h, dst_x:dst_x + w] = \
            self._pixels[src_y:src_y + h, src_x:src_x + w]

        return result

    def clear(self, color: ColorRGBA = (0, 0, 0, 0)) -> None:
        """
        Clear the framebuffer to a solid color.

        Args:
            color: RGBA color tuple. Defaults to transparent black.
        """
        self._pixels[:, :] = color

    def compare(self, other: VirtualFramebuffer) -> float:
        """
        Compare this framebuffer with another.

        Uses normalized RMS (Root Mean Square) difference to calculate
        similarity.

        Args:
            other: Another framebuffer to compare with.

        Returns:
            Similarity score from 0.0 (completely different) to 1.0 (identical).
            Returns 0.0 if dimensions don't match.
        """
        if (self._width, self._height) != (other._width, other._height):
            return 0.0

        diff = np.abs(
            self._pixels.astype(np.float32) - other._pixels.astype(np.float32)
        )
        rms = np.sqrt(np.mean(diff ** 2))
        similarity = 1.0 - (rms / 255.0)

        return float(np.clip(similarity, 0.0, 1.0))

    def get_diff_mask(
        self,
        other: VirtualFramebuffer,
        threshold: int = 10
    ) -> NDArray[np.bool_]:
        """
        Get a binary mask of changed pixels.

        Args:
            other: Another framebuffer to compare with.
            threshold: Minimum difference to consider a pixel changed.

        Returns:
            Boolean mask where True indicates a changed pixel.
        """
        diff = np.abs(
            self._pixels.astype(np.int16) - other._pixels.astype(np.int16)
        )
        return np.sum(diff, axis=2) > threshold

    def copy(self) -> VirtualFramebuffer:
        """Create a deep copy of this framebuffer."""
        fb = VirtualFramebuffer(self._width, self._height)
        fb._pixels = self._pixels.copy()
        return fb

    def to_rgba(self) -> NDArray[np.uint8]:
        """Return pixels as RGBA array (height, width, 4)."""
        return self._pixels.copy()

    def to_rgb(self) -> NDArray[np.uint8]:
        """Return pixels as RGB array (height, width, 3), dropping alpha."""
        return self._pixels[:, :, :3].copy()


# =============================================================================
# Refactored Function 5-8: Hilbert Curve Utilities
# =============================================================================

class HilbertCurve:
    """
    Efficient Hilbert curve coordinate mapping with caching.

    The Hilbert curve is a space-filling curve that maps 1D indices to
    2D coordinates while preserving locality. This is useful for packing
    linear binary data into 2D textures.

    Uses LRU caching for computed lookup tables.
    """

    _cache: dict[int, NDArray[np.uint32]] = {}
    _max_cache_size: int = 16

    @classmethod
    def get_lut(cls, order: int) -> NDArray[np.uint32]:
        """
        Get or create the Hilbert lookup table for a given order.

        Args:
            order: The curve order. Grid size is 2^order x 2^order.

        Returns:
            Lookup table of shape (N, 2) where N = 4^order.
            Each row is (x, y) coordinate.
        """
        if order in cls._cache:
            return cls._cache[order]

        # Manage cache size
        if len(cls._cache) >= cls._max_cache_size:
            # Remove oldest entry
            oldest = next(iter(cls._cache))
            del cls._cache[oldest]

        lut = cls._compute_lut(order)
        cls._cache[order] = lut
        return lut

    @staticmethod
    def _d2xy(n: int, d: int) -> tuple[int, int]:
        """
        Convert Hilbert index to (x, y) coordinates.

        Args:
            n: Grid size (must be power of 2).
            d: Hilbert curve index.

        Returns:
            (x, y) tuple of coordinates.
        """
        x = y = 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)

            # Rotate
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x

            x += s * rx
            y += s * ry
            d //= 4
            s *= 2

        return int(x), int(y)

    @classmethod
    def _compute_lut(cls, order: int) -> NDArray[np.uint32]:
        """Compute the full lookup table for a given order."""
        grid_size = 2 ** order
        total = grid_size * grid_size
        lut = np.zeros((total, 2), dtype=np.uint32)

        for d in range(total):
            x, y = cls._d2xy(grid_size, d)
            lut[d] = [x, y]

        return lut

    @classmethod
    def clear_cache(cls) -> None:
        """Clear the lookup table cache."""
        cls._cache.clear()


# =============================================================================
# Refactored Function 9-11: Color Utilities
# =============================================================================

def pack_rgba(r: int, g: int, b: int, a: int = 255) -> int:
    """
    Pack RGBA components into a 32-bit integer.

    Args:
        r: Red component (0-255).
        g: Green component (0-255).
        b: Blue component (0-255).
        a: Alpha component (0-255). Defaults to 255 (opaque).

    Returns:
        32-bit packed color value.
    """
    return (a << 24) | (b << 16) | (g << 8) | r


def unpack_rgba(packed: int) -> ColorRGBA:
    """
    Unpack a 32-bit integer into RGBA components.

    Args:
        packed: 32-bit packed color value.

    Returns:
        Tuple of (r, g, b, a) components.
    """
    r = packed & 0xFF
    g = (packed >> 8) & 0xFF
    b = (packed >> 16) & 0xFF
    a = (packed >> 24) & 0xFF
    return (r, g, b, a)


def lerp_color(
    c1: ColorRGBA,
    c2: ColorRGBA,
    t: float
) -> ColorRGBA:
    """
    Linear interpolation between two colors.

    Args:
        c1: First color.
        c2: Second color.
        t: Interpolation factor (0.0 = c1, 1.0 = c2).

    Returns:
        Interpolated color.
    """
    t = max(0.0, min(1.0, t))  # Clamp to [0, 1]
    return tuple(
        int(c1[i] + (c2[i] - c1[i]) * t)
        for i in range(4)
    )


# =============================================================================
# Refactored Function 12-14: Coordinate Utilities
# =============================================================================

def clamp_to_bounds(
    x: int,
    y: int,
    width: int,
    height: int
) -> Coordinate:
    """
    Clamp coordinates to valid bounds.

    Args:
        x: X coordinate.
        y: Y coordinate.
        width: Maximum width (exclusive).
        height: Maximum height (exclusive).

    Returns:
        Clamped (x, y) tuple.
    """
    return (
        max(0, min(x, width - 1)) if width > 0 else 0,
        max(0, min(y, height - 1)) if height > 0 else 0
    )


def rect_intersect(
    r1: Bounds,
    r2: Bounds
) -> Bounds | None:
    """
    Calculate the intersection of two rectangles.

    Args:
        r1: First rectangle (x, y, width, height).
        r2: Second rectangle (x, y, width, height).

    Returns:
        Intersection rectangle or None if no intersection.
    """
    x1 = max(r1[0], r2[0])
    y1 = max(r1[1], r2[1])
    x2 = min(r1[0] + r1[2], r2[0] + r2[2])
    y2 = min(r1[1] + r1[3], r2[1] + r2[3])

    if x2 <= x1 or y2 <= y1:
        return None

    return (x1, y1, x2 - x1, y2 - y1)


def rect_area(rect: Bounds | None) -> int:
    """
    Calculate the area of a rectangle.

    Args:
        rect: Rectangle (x, y, width, height) or None.

    Returns:
        Area of rectangle, or 0 if None.
    """
    if rect is None:
        return 0
    return rect[2] * rect[3]


# =============================================================================
# Refactored Function 15-17: Binary Data Utilities
# =============================================================================

def calculate_grid_size(data_length: int, min_order: int = 4) -> tuple[int, int]:
    """
    Calculate optimal grid size for packing binary data.

    Args:
        data_length: Length of data in bytes.
        min_order: Minimum Hilbert curve order (default 4 = 16x16).

    Returns:
        Tuple of (grid_size, hilbert_order).
    """
    pixels_needed = (data_length + 3) // 4
    order = max(min_order, math.ceil(math.log2(math.sqrt(max(1, pixels_needed)))))
    grid_size = 2 ** order
    return grid_size, order


def pad_to_grid(
    data: bytes,
    grid_size: int
) -> bytes:
    """
    Pad binary data to fill a square grid.

    Args:
        data: Binary data to pad.
        grid_size: Size of the square grid.

    Returns:
        Padded data of length grid_size * grid_size * 4.
    """
    target_length = grid_size * grid_size * 4
    if len(data) >= target_length:
        return data[:target_length]
    return data + b'\x00' * (target_length - len(data))


def pack_binary_to_rgba(
    data: bytes,
    grid_size: int,
    order: int
) -> NDArray[np.uint8]:
    """
    Pack binary data into RGBA image using Hilbert curve.

    Args:
        data: Binary data to pack.
        grid_size: Size of the output grid.
        order: Hilbert curve order.

    Returns:
        RGBA image array of shape (grid_size, grid_size, 4).
    """
    padded = pad_to_grid(data, grid_size)
    lut = HilbertCurve.get_lut(order)

    total_pixels = grid_size * grid_size
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

    for i in range(total_pixels):
        x, y = lut[i]
        offset = i * 4
        img_data[y, x] = [
            padded[offset],
            padded[offset + 1],
            padded[offset + 2],
            padded[offset + 3]
        ]

    return img_data


# =============================================================================
# Refactored Function 18-20: Hash and Checksum Utilities
# =============================================================================

def compute_cyclic_redundancy_check(data: bytes) -> int:
    """
    Compute CRC32 checksum of data.

    Args:
        data: Binary data.

    Returns:
        CRC32 checksum as 16-bit unsigned integer.
    """
    import zlib
    return zlib.crc32(data) & 0xFFFF


def compute_function_hash(name: str) -> int:
    """
    Compute a hash for a function name (Visual ABI compatibility).

    Args:
        name: Function name string.

    Returns:
        16-bit hash value.
    """
    return compute_cyclic_redundancy_check(name.encode('utf-8'))


def encode_address_to_rgba(address: int, hash_value: int) -> ColorRGBA:
    """
    Encode function hash and address into RGBA color.

    Used for Visual ABI function table encoding.

    Args:
        address: Function address (16-bit).
        hash_value: Function name hash (16-bit).

    Returns:
        RGBA color tuple encoding the values.
    """
    r = (hash_value >> 8) & 0xFF
    g = hash_value & 0xFF
    b = (address >> 8) & 0xFF
    a = address & 0xFF
    return (r, g, b, a)


def decode_address_from_rgba(color: ColorRGBA) -> tuple[int, int]:
    """
    Decode function hash and address from RGBA color.

    Args:
        color: RGBA color tuple.

    Returns:
        Tuple of (hash_value, address).
    """
    hash_value = (color[0] << 8) | color[1]
    address = (color[2] << 8) | color[3]
    return hash_value, address

"""
PixelRTS Encoder - Convert data to PixelRTS format (.rts.png)

Encodes arbitrary data into PNG images using Hilbert curve mapping
and color encoding for storage and transmission.
"""

import json
import zlib
from pathlib import Path
from typing import Union, Dict, Any, Optional
import numpy as np
from PIL import Image


# Simple Hilbert curve implementation (can be replaced with actual one later)
class HilbertCurve:
    """Hilbert curve implementation."""

    def __init__(self, order: int):
        self.order = order
        self.grid_size = 2**order

    def _d2xy(self, n: int, d: int) -> tuple:
        """
        Convert Hilbert curve distance d to (x, y) coordinates.
        Based on the algorithm from "Hacker's Delight" by Henry S. Warren.
        
        Args:
            n: Grid size (must be power of 2)
            d: Distance along the curve (0 to n*n-1)
        
        Returns:
            (x, y) tuple of coordinates
        """
        x = y = 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)
            x, y = self._rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return (x, y)

    def _rot(self, n: int, x: int, y: int, rx: int, ry: int) -> tuple:
        """Rotate/flip a quadrant appropriately."""
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            x, y = y, x
        return (x, y)

    def generate_lut(self):
        """Generate lookup table for Hilbert curve traversal.
        
        Returns a list of (x, y) tuples in Hilbert curve order,
        visiting each point in the grid exactly once.
        """
        lut = []
        n = self.grid_size
        for d in range(n * n):
            lut.append(self._d2xy(n, d))
        return lut


# Try to import actual PixelRTS modules, fall back to our simple implementations
try:
    from .pixelrts_v2_core import HilbertCurve as ActualHilbertCurve
    from .pixelrts_layout import get_zone_for_file, Zone
    from .pixelrts_compression import compress_data, CompressionType, CompressionLevel

    # Use actual implementations if available
    HilbertCurve = ActualHilbertCurve
    HAS_PIXELRTS_MODULES = True
except ImportError:
    # Fallback implementations
    def get_zone_for_file(file_path: str) -> str:
        """Fallback: return default zone."""
        return "default"

    class Zone:
        """Fallback zone class."""

        DEFAULT = "default"

        def __init__(self, value: str):
            self.value = value

    def compress_data(data: bytes, compression_type: str = "zlib", level: int = 6) -> bytes:
        """Fallback compression using zlib or no compression."""
        if compression_type == "zlib":
            import zlib

            return zlib.compress(data)
        return data

    class CompressionType:
        ZLIB = "zlib"
        NONE = "none"

    class CompressionLevel:
        DEFAULT = 6

    HAS_PIXELRTS_MODULES = False


def encode_to_pixelrts(
    data: Union[bytes, str, Dict[Any, Any]],
    output_path: Union[str, Path],
    *,
    hilbert_order: int = 10,
    compress: bool = True,
    compression_type: str = "zlib",
    zone: Optional[str] = None,
) -> Dict[str, Any]:
    """
    Encode data to PixelRTS format and save as PNG.

    Args:
        data: Data to encode (bytes, string, or dict)
        output_path: Path to save the .rts.png file
        hilbert_order: Hilbert curve order (default 10 = 1024x1024)
        compress: Whether to compress data before encoding
        compression_type: Compression algorithm ("zlib" or "none")
        zone: Memory zone for optimization (if layout available)

    Returns:
        Dict with encoding statistics

    Raises:
        ValueError: If data is too large for the image dimensions
        RuntimeError: If encoding fails
    """
    start_time = __import__("time").time()

    # Convert data to bytes
    if isinstance(data, dict):
        data_bytes = json.dumps(data, separators=(",", ":")).encode("utf-8")
    elif isinstance(data, str):
        data_bytes = data.encode("utf-8")
    elif isinstance(data, bytes):
        data_bytes = data
    else:
        raise TypeError(f"Unsupported data type: {type(data)}")

    # Compress if requested
    if compress and compression_type == "zlib":
        try:
            data_bytes = zlib.compress(data_bytes)
        except Exception as e:
            raise RuntimeError(f"Compression failed: {e}")
    else:
        # Store original size metadata
        metadata["original_size"] = len(data_bytes)

    # Calculate required image size
    data_size = len(data_bytes)
    # Each pixel stores 4 bytes (RGBA)
    min_pixels_needed = (data_size + 3) // 4  # Round up

    # Use Hilbert curve to determine grid size
    hilbert = HilbertCurve(hilbert_order)
    grid_size = hilbert.grid_size
    max_pixels = grid_size * grid_size

    if min_pixels_needed > max_pixels:
        # Need higher order curve
        order_needed = (min_pixels_needed - 1).bit_length()
        hilbert = HilbertCurve(order_needed)
        grid_size = hilbert.grid_size

    # Create image
    img = Image.new("RGBA", (grid_size, grid_size), (0, 0, 0, 0))
    pixels = img.load()

    # Add metadata header (first 64 pixels for metadata)
    metadata = {
        "magic": "PixelRTS",
        "version": "1.0",
        "compressed": compress,
        "compression_type": compression_type if compress else None,
        "original_size": len(data_bytes) if not compress else None,
        "hilbert_order": hilbert.order,
        "zone": zone,
    }

    # Encode metadata as JSON in first pixels
    metadata_bytes = json.dumps(metadata).encode("utf-8")
    metadata_padded = metadata_bytes.ljust(64 * 4, b"\x00")  # 64 pixels * 4 bytes

    # Encode data pixels
    all_data = metadata_padded + data_bytes
    data_index = 0

    # Get Hilbert curve traversal order
    lut = hilbert.generate_lut()

    for pixel_index, (x, y) in enumerate(lut):
        if data_index >= len(all_data):
            # Fill remaining pixels with black
            pixels[x, y] = (0, 0, 0, 0)
            continue

        # Get 4 bytes for this pixel (RGBA)
        byte_slice = all_data[data_index : data_index + 4]
        # Pad with zeros if needed
        byte_slice = byte_slice.ljust(4, b"\x00")

        pixels[x, y] = (
            byte_slice[0],  # R
            byte_slice[1],  # G
            byte_slice[2],  # B
            byte_slice[3],  # A
        )

        data_index += 4

    # Save image
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    img.save(output_path, format="PNG", compress_level=6)

    elapsed = __import__("time").time() - start_time

    return {
        "success": True,
        "output_path": str(output_path),
        "original_size": len(data_bytes) if not compress else metadata.get("original_size", 0),
        "encoded_size": output_path.stat().st_size,
        "hilbert_order": hilbert.order,
        "image_dimensions": f"{grid_size}x{grid_size}",
        "pixels_used": (data_index + 3) // 4,
        "encoding_time_ms": round(elapsed * 1000, 2),
        "compression_ratio": round(len(data_bytes) / output_path.stat().st_size, 2)
        if output_path.stat().st_size > 0
        else 0,
    }


def encode_file_to_pixelrts(
    file_path: Union[str, Path], output_path: Optional[Union[str, Path]] = None, **kwargs
) -> Dict[str, Any]:
    """
    Encode a file to PixelRTS format.

    Args:
        file_path: Path to file to encode
        output_path: Output path (defaults to file_path.rts.png)
        **kwargs: Additional arguments passed to encode_to_pixelrts

    Returns:
        Dict with encoding statistics
    """
    file_path = Path(file_path)
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    if output_path is None:
        output_path = file_path.with_suffix(file_path.suffix + ".rts.png")

    # Read file data
    with open(file_path, "rb") as f:
        data = f.read()

    # Add filename to metadata if encoding dict
    if isinstance(data, bytes) and not kwargs.get("metadata", {}):
        # Try to decode as JSON, if it fails treat as raw bytes
        try:
            json_data = json.loads(data.decode("utf-8"))
            if isinstance(json_data, dict):
                json_data["_filename"] = file_path.name
                data = json_data
        except (json.JSONDecodeError, UnicodeDecodeError):
            pass  # Keep as raw bytes

    result = encode_to_pixelrts(data, output_path, **kwargs)
    result["input_path"] = str(file_path)
    return result


if __name__ == "__main__":
    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Encode data to PixelRTS format")
    parser.add_argument("input", help="Input file or string")
    parser.add_argument("-o", "--output", help="Output .rts.png file")
    parser.add_argument("--no-compress", action="store_true", help="Disable compression")
    parser.add_argument("--hilbert-order", type=int, default=10, help="Hilbert curve order")
    parser.add_argument("--string", action="store_true", help="Treat input as string")

    args = parser.parse_args()

    try:
        if args.string:
            data = args.input
            result = encode_to_pixelrts(
                data,
                args.output or "output.rts.png",
                compress=not args.no_compress,
                hilbert_order=args.hilbert_order,
            )
        else:
            result = encode_file_to_pixelrts(
                args.input,
                args.output,
                compress=not args.no_compress,
                hilbert_order=args.hilbert_order,
            )

        print("✅ Encoding successful!")
        print(f"Input: {result.get('input_path', 'string')}")
        print(f"Output: {result['output_path']}")
        print(f"Size: {result['original_size']} → {result['encoded_size']} bytes")
        print(f"Compression: {result['compression_ratio']:.2f}x")
        print(f"Dimensions: {result['image_dimensions']}")
        print(f"Time: {result['encoding_time_ms']}ms")

    except Exception as e:
        print(f"❌ Encoding failed: {e}")
        sys.exit(1)

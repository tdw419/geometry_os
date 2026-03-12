"""
PixelRTS Decoder - Convert PixelRTS format (.rts.png) back to data

Decodes PNG images encoded with PixelRTS format back into original data.
"""

import json
import zlib
from pathlib import Path
from typing import Union, Dict, Any, Optional, Tuple
import numpy as np
from PIL import Image


# Hilbert curve implementation
class HilbertCurve:
    """Hilbert curve implementation using recursive transformation."""

    def __init__(self, order: int):
        self.order = order
        self.grid_size = 2**order

    def generate_lut(self) -> list:
        """Generate lookup table for Hilbert curve."""
        n = self.order
        
        # Generate Hilbert curve using recursive transformation
        points = [(0, 0)]
        
        # Iteratively build larger curves
        for level in range(1, n + 1):
            size = 2**(level - 1)
            new_points = []
            
            for x, y in points:
                if level == 1:
                    new_points.append((x, y))
                else:
                    transformed_x = (x + y) % size
                    transformed_y = (x - y) % size
                    new_points.append((transformed_x, transformed_y))
            
            points = new_points
            
        return points


# Try to import actual PixelRTS modules, fall back to our simple implementations
try:
    from .pixelrts_v2_core import HilbertCurve as ActualHilbertCurve

    # Use actual implementation if available
    HilbertCurve = ActualHilbertCurve
    HAS_PIXELRTS_MODULES = True
except ImportError:
    # Fallback implementation already defined above
    HAS_PIXELRTS_MODULES = False


def decode_from_pixelrts(
    image_path: Union[str, Path], *, return_as_string: bool = False, return_as_dict: bool = False
) -> Union[bytes, str, Dict[Any, Any]]:
    """
    Decode data from PixelRTS format PNG.

    Args:
        image_path: Path to the .rts.png file
        return_as_string: If True, return decoded data as UTF-8 string
        return_as_dict: If True, try to parse decoded data as JSON dict

    Returns:
        Decoded data as bytes, string, or dict

    Raises:
        FileNotFoundError: If image file doesn't exist
        ValueError: If image is not a valid PixelRTS format
        RuntimeError: If decoding fails
    """
    image_path = Path(image_path)
    if not image_path.exists():
        raise FileNotFoundError(f"Image file not found: {image_path}")

    # Load image
    try:
        img = Image.open(image_path)
        if img.mode != "RGBA":
            img = img.convert("RGBA")
    except Exception as e:
        raise ValueError(f"Failed to load image: {e}")

    width, height = img.size
    if width != height:
        raise ValueError("PixelRTS images must be square")

    # Get pixel data
    pixels = np.array(img)

    # Extract data from pixels in Hilbert curve order
    # We need to determine the hilbert order from the image size
    # grid_size = 2^order, so order = log2(grid_size)
    import math

    grid_size = width
    hilbert_order = int(math.log2(grid_size))

    # Verify it's a power of 2
    if 2**hilbert_order != grid_size:
        raise ValueError(f"Image size {grid_size} is not a power of 2")

    # Generate Hilbert curve LUT
    hilbert = HilbertCurve(hilbert_order)
    lut = hilbert.generate_lut()

    # Extract byte data from pixels
    byte_data = bytearray()

    for x, y in lut:
        if x >= width or y >= height:
            continue
        pixel = pixels[y, x]  # Note: numpy array is [y, x]
        byte_data.extend([pixel[0], pixel[1], pixel[2], pixel[3]])  # RGBA

    # First 64 pixels (256 bytes) contain metadata
    if len(byte_data) < 64 * 4:
        raise ValueError("Image too small to contain metadata")

    metadata_bytes = byte_data[: 64 * 4]
    data_bytes = byte_data[64 * 4 :]

    # Parse metadata
    try:
        # Remove padding null bytes
        metadata_str = metadata_bytes.rstrip(b"\x00").decode("utf-8")
        metadata = json.loads(metadata_str)
    except (json.JSONDecodeError, UnicodeDecodeError) as e:
        raise ValueError(f"Invalid or corrupted metadata: {e}")

    # Validate magic number
    if metadata.get("magic") != "PixelRTS":
        raise ValueError("Not a valid PixelRTS image (invalid magic)")

    # Extract data
    compressed = metadata.get("compressed", False)
    compression_type = metadata.get("compression_type")
    original_size = metadata.get("original_size")

    if compressed and compression_type == "zlib":
        try:
            data_bytes = zlib.decompress(data_bytes)
        except Exception as e:
            raise RuntimeError(f"Decompression failed: {e}")

    # Validate size if provided
    if original_size is not None and len(data_bytes) != original_size:
        raise ValueError(f"Data size mismatch: expected {original_size}, got {len(data_bytes)}")

    # Return in requested format
    if return_as_dict:
        try:
            return json.loads(data_bytes.decode("utf-8"))
        except (json.JSONDecodeError, UnicodeDecodeError):
            # If not valid JSON, return as string
            if return_as_string:
                return data_bytes.decode("utf-8", errors="replace")
            return data_bytes
    elif return_as_string:
        return data_bytes.decode("utf-8", errors="replace")
    else:
        return data_bytes


def decode_pixelrts_to_file(
    image_path: Union[str, Path],
    output_path: Optional[Union[str, Path]] = None,
    *,
    return_as_string: bool = False,
    return_as_dict: bool = False,
) -> Dict[str, Any]:
    """
    Decode a PixelRTS image and save to file.

    Args:
        image_path: Path to the .rts.png file
        output_path: Output path (defaults to removing .rts.png extension)
        return_as_string: If True, save decoded data as UTF-8 string
        return_as_dict: If True, save decoded data as JSON

    Returns:
        Dict with decoding statistics
    """
    import time

    start_time = time.time()

    image_path = Path(image_path)
    if not image_path.exists():
        raise FileNotFoundError(f"Image file not found: {image_path}")

    # Determine output path
    if output_path is None:
        if image_path.suffix == ".png" and ".rts" in image_path.name:
            # Remove .rts.png extension
            output_path = image_path.with_suffix("").with_suffix("")
        else:
            output_path = image_path.with_suffix(".decoded")

    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Decode data
    try:
        data = decode_from_pixelrts(
            image_path, return_as_string=return_as_string, return_as_dict=return_as_dict
        )
    except Exception as e:
        raise RuntimeError(f"Decoding failed: {e}")

    # Write data to file
    try:
        if isinstance(data, dict):
            with open(output_path, "w", encoding="utf-8") as f:
                json.dump(data, f, separators=(",", ":"))
        elif isinstance(data, str):
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(data)
        else:  # bytes
            with open(output_path, "wb") as f:
                f.write(data)
    except Exception as e:
        raise RuntimeError(f"Failed to write output file: {e}")

    elapsed = time.time() - start_time

    return {
        "success": True,
        "input_path": str(image_path),
        "output_path": str(output_path),
        "original_size": image_path.stat().st_size,
        "decoded_size": output_path.stat().st_size,
        "decoding_time_ms": round(elapsed * 1000, 2),
        "format": "dict"
        if isinstance(data, dict)
        else "string"
        if isinstance(data, str)
        else "bytes",
    }


if __name__ == "__main__":
    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Decode data from PixelRTS format")
    parser.add_argument("input", help="Input .rts.png file")
    parser.add_argument("-o", "--output", help="Output file")
    parser.add_argument("--string", action="store_true", help="Output as UTF-8 string")
    parser.add_argument("--json", action="store_true", help="Output as JSON (if valid)")

    args = parser.parse_args()

    try:
        if args.output:
            result = decode_pixelrts_to_file(
                args.input, args.output, return_as_string=args.string, return_as_dict=args.json
            )
            print("✅ Decoding successful!")
            print(f"Input: {result['input_path']}")
            print(f"Output: {result['output_path']}")
            print(f"Size: {result['original_size']} → {result['decoded_size']} bytes")
            print(f"Time: {result['decoding_time_ms']}ms")
            print(f"Format: {result['format']}")
        else:
            data = decode_from_pixelrts(
                args.input, return_as_string=args.string, return_as_dict=args.json
            )
            if isinstance(data, bytes) and not args.string and not args.json:
                sys.stdout.buffer.write(data)
            else:
                print(data)

    except Exception as e:
        print(f"❌ Decoding failed: {e}")
        sys.exit(1)

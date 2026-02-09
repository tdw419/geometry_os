"""
WASM Extractor for PixelRTS

Extracts WebAssembly binaries from .rts.png files using Hilbert curve decoding.

Usage:
    from systems.pixel_compiler import WASMExtractor

    # Extract WASM from .rts.png
    wasm_bytes = WASMExtractor.extract_from_png("program.rts.png")

    # Validate WASM
    if WASMExtractor.validate_wasm(wasm_bytes):
        print("Valid WASM binary")

    # Extract from tiled format
    wasm_bytes = WASMExtractor.extract_from_tiled("tiled_index.json")
"""

from pathlib import Path
import json
from typing import Optional

from systems.pixel_compiler.pixelrts_v2_core import (
    HilbertCurve,
    PixelRTSDecoder
)


class WASMExtractionError(Exception):
    """Raised when WASM extraction fails."""
    pass


class WASMExtractor:
    """
    Extracts WebAssembly binaries from PixelRTS .rts.png files.

    The extractor uses Hilbert curve decoding to reverse the spatial encoding
    used when embedding WASM into PNG images.
    """

    # WASM magic number: 0x00 0x61 0x73 0x6d
    WASM_MAGIC = b'\x00\x61\x73\x6d'

    @staticmethod
    def validate_wasm(wasm_bytes: bytes) -> bool:
        """
        Verify that bytes contain a valid WASM binary.

        Args:
            wasm_bytes: Bytes to validate

        Returns:
            True if bytes start with WASM magic number

        The WebAssembly magic number is 0x6d736100 (little-endian),
        which appears as bytes 0x00 0x61 0x73 0x6d.
        """
        if not wasm_bytes or len(wasm_bytes) < 4:
            return False
        return wasm_bytes[:4] == WASMExtractor.WASM_MAGIC

    @staticmethod
    def extract_from_png(
        png_path: Path | str,
        expected_size: Optional[int] = None
    ) -> bytes:
        """
        Extract WASM binary from .rts.png file.

        Uses Hilbert curve decoding to extract embedded binary data.
        Optionally uses sidecar metadata for data size information.

        Args:
            png_path: Path to .rts.png file
            expected_size: Expected WASM size in bytes (optional, for validation)

        Returns:
            Extracted WASM bytes

        Raises:
            FileNotFoundError: If PNG file doesn't exist
            WASMExtractionError: If extraction fails or PNG is invalid

        Example:
            >>> wasm = WASMExtractor.extract_from_png("fibonacci.rts.png")
            >>> if WASMExtractor.validate_wasm(wasm):
            ...     print(f"Extracted {len(wasm)} bytes of valid WASM")
        """
        png_path = Path(png_path)

        if not png_path.exists():
            raise FileNotFoundError(f"PNG file not found: {png_path}")

        try:
            # Use PixelRTSDecoder for extraction
            decoder = PixelRTSDecoder()

            # Try to load metadata from sidecar
            meta_path = png_path.with_suffix('.meta.json')
            if meta_path.exists():
                with open(meta_path, 'r') as f:
                    metadata = json.load(f)
                decoder.set_metadata(metadata)
            else:
                # Try alternate path for .rts.png
                alt_meta_path = png_path.parent / f"{png_path.stem}.meta.json"
                if alt_meta_path.exists():
                    with open(alt_meta_path, 'r') as f:
                        metadata = json.load(f)
                    decoder.set_metadata(metadata)

            # Load and decode
            wasm_bytes = decoder.load(str(png_path), verify_hash=False)

            # Trim to expected size if provided
            if expected_size is not None and len(wasm_bytes) > expected_size:
                wasm_bytes = wasm_bytes[:expected_size]

            return wasm_bytes

        except FileNotFoundError:
            raise
        except Exception as e:
            raise WASMExtractionError(f"Failed to extract WASM from {png_path}: {e}")

    @staticmethod
    def extract_from_tiled(
        index_path: Path | str,
        tile_dir: Optional[Path | str] = None
    ) -> bytes:
        """
        Extract WASM binary from tiled format.

        Tiled format splits large WASM binaries across multiple PNG tiles.
        An index JSON file describes the tiling layout.

        Args:
            index_path: Path to tiled index JSON file
            tile_dir: Directory containing tile PNGs (defaults to index parent dir)

        Returns:
            Reconstructed WASM bytes

        Raises:
            FileNotFoundError: If index or tiles are missing
            WASMExtractionError: If extraction fails

        Example:
            >>> wasm = WASMExtractor.extract_from_tiled("large_wasm_index.json")
            >>> if WASMExtractor.validate_wasm(wasm):
            ...     print("Reconstructed WASM from tiles")
        """
        index_path = Path(index_path)

        if not index_path.exists():
            raise FileNotFoundError(f"Tiled index not found: {index_path}")

        try:
            # Load index
            with open(index_path, 'r') as f:
                index = json.load(f)

            # Validate index format
            if index.get("format") != "tiled":
                raise WASMExtractionError(f"Invalid tiled format index: {index_path}")

            # Determine tile directory
            if tile_dir is None:
                tile_dir = index_path.parent
            else:
                tile_dir = Path(tile_dir)

            if not tile_dir.exists():
                raise FileNotFoundError(f"Tile directory not found: {tile_dir}")

            # Extract and concatenate tiles
            wasm_parts = []
            for tile_name in index.get("tiles", []):
                tile_path = tile_dir / tile_name
                if not tile_path.exists():
                    raise FileNotFoundError(f"Tile not found: {tile_path}")

                tile_data = WASMExtractor.extract_from_png(tile_path)
                wasm_parts.append(tile_data)

            # Combine all tiles
            wasm_bytes = b''.join(wasm_parts)

            # Trim to expected total size
            total_size = index.get("total_size")
            if total_size is not None and len(wasm_bytes) > total_size:
                wasm_bytes = wasm_bytes[:total_size]

            return wasm_bytes

        except FileNotFoundError:
            raise
        except Exception as e:
            raise WASMExtractionError(f"Failed to extract tiled WASM from {index_path}: {e}")

    @classmethod
    def get_info(cls, png_path: Path | str) -> dict:
        """
        Get metadata information about a .rts.png file.

        Args:
            png_path: Path to .rts.png file

        Returns:
            Dictionary with metadata including:
            - format: PixelRTS version
            - grid_size: Image dimension
            - data_size: Embedded data size
            - data_hash: SHA256 hash
            - is_wasm: Whether embedded data is valid WASM

        Raises:
            FileNotFoundError: If file doesn't exist
            WASMExtractionError: If info cannot be read
        """
        png_path = Path(png_path)

        if not png_path.exists():
            raise FileNotFoundError(f"PNG file not found: {png_path}")

        try:
            decoder = PixelRTSDecoder()
            info = decoder.info(str(png_path))

            # Add WASM validation
            if "data_size" in info:
                # Extract a small sample to check for WASM magic
                try:
                    sample = cls.extract_from_png(png_path, expected_size=8)
                    info["is_wasm"] = cls.validate_wasm(sample)
                except:
                    info["is_wasm"] = False
            else:
                info["is_wasm"] = None

            return info

        except Exception as e:
            raise WASMExtractionError(f"Failed to get info for {png_path}: {e}")

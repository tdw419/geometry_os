"""
Delta Patch Applier
Applies delta manifests to update local .rts.png copies.
"""

import hashlib
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Protocol

from systems.pixel_compiler.delta_manifest import DeltaManifest, DeltaRegion


class PatchError(Exception):
    """
    Exception raised when patching fails.

    Attributes:
        message: Human-readable error description
        region_index: Index of the region that failed (if applicable)
    """

    def __init__(self, message: str, region_index: Optional[int] = None):
        super().__init__(message)
        self.message = message
        self.region_index = region_index

    def __str__(self):
        if self.region_index is not None:
            return f"Region {self.region_index}: {self.message}"
        return self.message


class ByteFetcher(Protocol):
    """Protocol for fetching region bytes from remote source."""

    def fetch_region(self, offset: int, length: int) -> bytes:
        """
        Fetch bytes for a specific region.

        Args:
            offset: Byte offset in the remote file
            length: Number of bytes to fetch

        Returns:
            The requested bytes
        """
        ...


class DeltaPatcher:
    """
    Applies delta manifests to update local .rts.png files.

    Validates checksums before and after patching to ensure integrity.
    Supports both in-place and output-to-new-file patching modes.
    """

    def __init__(self, validate_checksums: bool = True):
        """
        Initialize the patcher.

        Args:
            validate_checksums: If True, validate all checksums during patching
        """
        self.validate_checksums = validate_checksums

    def _compute_sha256(self, data: bytes) -> str:
        """
        Compute SHA-256 hash of data.

        Args:
            data: Bytes to hash

        Returns:
            Hex digest string
        """
        return hashlib.sha256(data).hexdigest()

    def _validate_file_checksum(self, path: str, expected: str) -> bool:
        """
        Validate SHA-256 checksum of a file.

        Args:
            path: Path to file
            expected: Expected SHA-256 hex digest

        Returns:
            True if checksum matches

        Raises:
            PatchError: If file cannot be read or checksum mismatches
        """
        try:
            with open(path, 'rb') as f:
                data = f.read()
            actual = self._compute_sha256(data)
            if actual != expected:
                raise PatchError(
                    f"File checksum mismatch: expected {expected[:16]}..., got {actual[:16]}..."
                )
            return True
        except FileNotFoundError:
            raise PatchError(f"File not found: {path}")
        except IOError as e:
            raise PatchError(f"Failed to read file: {e}")

    def _validate_region_checksum(
        self,
        data: bytes,
        offset: int,
        length: int,
        expected: str,
        region_index: int
    ) -> None:
        """
        Validate SHA-256 checksum of a byte region.

        Args:
            data: Full byte array
            offset: Start offset of region
            length: Length of region
            expected: Expected SHA-256 hex digest
            region_index: Index of region (for error messages)

        Raises:
            PatchError: If checksum mismatches
        """
        if offset + length > len(data):
            raise PatchError(
                f"Region extends beyond data bounds (offset={offset}, length={length}, data_size={len(data)})",
                region_index=region_index
            )

        region_data = data[offset:offset + length]
        actual = self._compute_sha256(region_data)

        if actual != expected:
            raise PatchError(
                f"Region checksum mismatch: expected {expected[:16]}..., got {actual[:16]}...",
                region_index=region_index
            )

    def _validate_old_checksum(self, base_data: bytes, manifest: DeltaManifest) -> None:
        """
        Validate that base file matches the expected old checksum.

        Args:
            base_data: Raw bytes of the base file
            manifest: Delta manifest with expected checksum

        Raises:
            PatchError: If checksum mismatches
        """
        actual = self._compute_sha256(base_data)
        if actual != manifest.old_checksum:
            raise PatchError(
                f"Base file checksum mismatch: expected {manifest.old_checksum[:16]}..., "
                f"got {actual[:16]}... The base file may have been modified or corrupted."
            )

    def apply(
        self,
        base_path: str,
        manifest: DeltaManifest,
        output_path: Optional[str] = None,
        byte_fetcher: Optional[ByteFetcher] = None
    ) -> str:
        """
        Apply a delta manifest to a base file.

        Args:
            base_path: Path to the base .rts.png file
            manifest: Delta manifest describing changes
            output_path: Optional output path (if None, patches in-place)
            byte_fetcher: Optional fetcher for remote region data

        Returns:
            Path to the patched file

        Raises:
            PatchError: If patching fails (checksum mismatch, I/O error, etc.)
        """
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder, PixelRTSEncoder

        # Read base file (PNG bytes)
        try:
            with open(base_path, 'rb') as f:
                base_png_bytes = f.read()
        except FileNotFoundError:
            raise PatchError(f"Base file not found: {base_path}")
        except IOError as e:
            raise PatchError(f"Failed to read base file: {e}")

        # Decode PNG to get raw data bytes
        try:
            decoder = PixelRTSDecoder()
            base_data = decoder.decode(base_png_bytes)
        except Exception as e:
            raise PatchError(f"Failed to decode base file: {e}")

        # Validate base file matches expected old checksum
        if self.validate_checksums:
            self._validate_old_checksum(base_data, manifest)

        # Create output buffer
        output_data = bytearray(manifest.new_size)

        # Convert base data to mutable array for easier handling
        base_array = bytearray(base_data)

        # Copy unchanged bytes from base to output
        # Track which bytes are changed
        changed_mask = [False] * manifest.new_size

        for region in manifest.regions:
            for i in range(region.length):
                byte_offset = region.offset + i
                if byte_offset < len(changed_mask):
                    changed_mask[byte_offset] = True

        # Copy unchanged bytes from base (up to min of old and new size)
        copy_size = min(len(base_array), manifest.new_size)
        for i in range(copy_size):
            if not changed_mask[i]:
                output_data[i] = base_array[i]

        # Apply patches from manifest
        for region_index, region in enumerate(manifest.regions):
            # For now, use placeholder (zeros) - byte_fetcher provides actual data
            # In Plan 03, byte_fetcher will fetch from remote
            if byte_fetcher is not None:
                try:
                    region_data = byte_fetcher.fetch_region(region.offset, region.length)
                except Exception as e:
                    raise PatchError(
                        f"Failed to fetch region data: {e}",
                        region_index=region_index
                    )
            else:
                # No fetcher - use data from base if available (for moves/copies)
                # Otherwise, keep existing bytes (assume already in place)
                if region.source_offset is not None and region.source_offset < len(base_array):
                    # Copy from source location in base
                    source_end = min(region.source_offset + region.length, len(base_array))
                    region_data = bytes(base_array[region.source_offset:source_end])
                else:
                    # Keep existing bytes from base (for validation-only patches)
                    region_end = min(region.offset + region.length, len(base_array))
                    if region.offset < len(base_array):
                        region_data = bytes(base_array[region.offset:region_end])
                    else:
                        # New bytes at end of file - use zeros as placeholder
                        region_data = bytes(region.length)

            # Validate region checksum if we have data
            if self.validate_checksums and len(region_data) == region.length:
                self._validate_region_checksum(
                    region_data, 0, region.length, region.checksum, region_index
                )

            # Apply region data to output
            for i, byte in enumerate(region_data):
                if region.offset + i < len(output_data):
                    output_data[region.offset + i] = byte

        # Validate final output checksum
        if self.validate_checksums:
            actual_checksum = self._compute_sha256(bytes(output_data))
            if actual_checksum != manifest.new_checksum:
                raise PatchError(
                    f"Output checksum mismatch: expected {manifest.new_checksum[:16]}..., "
                    f"got {actual_checksum[:16]}... Patch may be corrupted."
                )

        # Determine output path
        final_output_path = output_path if output_path else base_path

        # Encode output data back to PNG
        try:
            encoder = PixelRTSEncoder()
            # Get metadata from decoder if available
            metadata = decoder.get_metadata() if decoder else {}
            output_png_bytes = encoder.encode(bytes(output_data), metadata=metadata)
        except Exception as e:
            raise PatchError(f"Failed to encode output file: {e}")

        # Write output atomically (use temp file for in-place)
        if output_path is None:
            # In-place patching - use temp file for atomicity
            base_dir = Path(base_path).parent
            with tempfile.NamedTemporaryFile(
                mode='wb',
                dir=base_dir,
                prefix='.patch_',
                suffix='.tmp',
                delete=False
            ) as tmp_file:
                tmp_path = tmp_file.name
                tmp_file.write(output_png_bytes)

            # Atomic rename
            import os
            os.replace(tmp_path, final_output_path)
        else:
            # Write to new file
            with open(final_output_path, 'wb') as f:
                f.write(output_png_bytes)

        return final_output_path

    def apply_with_fetcher(
        self,
        base_path: str,
        manifest: DeltaManifest,
        byte_fetcher: ByteFetcher,
        output_path: Optional[str] = None
    ) -> str:
        """
        Apply patch with remote byte fetching.

        Convenience method that wraps apply() with a byte_fetcher.

        Args:
            base_path: Path to the base .rts.png file
            manifest: Delta manifest describing changes
            byte_fetcher: Fetcher for remote region data
            output_path: Optional output path (if None, patches in-place)

        Returns:
            Path to the patched file
        """
        return self.apply(base_path, manifest, output_path=output_path, byte_fetcher=byte_fetcher)


def apply_delta_patch(
    base_path: str,
    manifest: DeltaManifest,
    output_path: Optional[str] = None,
    validate_checksums: bool = True,
    byte_fetcher: Optional[ByteFetcher] = None
) -> str:
    """
    Convenience function to apply a delta patch.

    Args:
        base_path: Path to the base .rts.png file
        manifest: Delta manifest describing changes
        output_path: Optional output path (if None, patches in-place)
        validate_checksums: If True, validate all checksums
        byte_fetcher: Optional fetcher for remote region data

    Returns:
        Path to the patched file

    Raises:
        PatchError: If patching fails
    """
    patcher = DeltaPatcher(validate_checksums=validate_checksums)
    return patcher.apply(base_path, manifest, output_path, byte_fetcher)

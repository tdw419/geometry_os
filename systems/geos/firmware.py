"""
Geometry OS Firmware Crystallizer
Converts opaque GPU firmware blobs into spatial RTS textures.

The firmware is stored as pixels, not files. The C kernel extracts
bytes from the texture and writes them to GPU MMIO registers.
"""

import numpy as np
from PIL import Image
from pathlib import Path
from typing import Optional, Tuple
from dataclasses import dataclass
import hashlib
import struct
import gzip
import subprocess
import tempfile


@dataclass
class FirmwareTexture:
    """Represents a firmware blob crystallized as an RTS texture."""
    name: str
    original_size: int
    checksum: str
    texture_path: str
    grid_size: int


def _pack_bytes_to_pixels(data: bytes) -> Tuple[np.ndarray, int]:
    """
    Pack binary data into RGBA pixels.
    Returns the pixel array and the grid size needed.
    """
    # Header: 16 bytes (4 pixels)
    # - 4 bytes: magic "FWGE" (Firmware GEometry)
    # - 4 bytes: original size (uint32, little-endian)
    # - 8 bytes: checksum (first 8 bytes of SHA256)

    checksum = hashlib.sha256(data).digest()[:8]
    header = b'FWGE' + struct.pack('<I', len(data)) + checksum

    # Combine header + data
    payload = header + data

    # Pad to multiple of 4 bytes (one RGBA pixel)
    padding = (4 - (len(payload) % 4)) % 4
    payload += b'\x00' * padding

    # Calculate grid size (power of 2)
    num_pixels = len(payload) // 4
    grid_size = 1
    while grid_size * grid_size < num_pixels:
        grid_size *= 2

    # Create pixel array
    pixels = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

    # Fill with data
    for i in range(num_pixels):
        offset = i * 4
        if offset + 4 <= len(payload):
            x, y = i % grid_size, i // grid_size
            if y < grid_size:
                pixels[y, x] = [
                    payload[offset],
                    payload[offset + 1],
                    payload[offset + 2],
                    payload[offset + 3]
                ]

    return pixels, grid_size


def _extract_pixels_to_bytes(pixels: np.ndarray) -> Tuple[bytes, int, bytes]:
    """
    Extract binary data from RGBA pixels.
    Returns (payload, original_size, checksum).
    """
    grid_size = pixels.shape[0]
    payload = bytearray()

    for y in range(grid_size):
        for x in range(grid_size):
            r, g, b, a = pixels[y, x]
            payload.extend([r, g, b, a])

    # Parse header
    if payload[:4] != b'FWGE':
        raise ValueError("Invalid firmware texture: missing FWGE magic")

    original_size = struct.unpack('<I', bytes(payload[4:8]))[0]
    checksum = bytes(payload[8:16])

    # Extract original data (skip 16-byte header)
    data = bytes(payload[16:16 + original_size])

    return data, original_size, checksum


def crystallize_firmware(
    firmware_path: str,
    output_path: Optional[str] = None,
    name: Optional[str] = None
) -> FirmwareTexture:
    """
    Convert a firmware binary blob into an RTS texture.

    Args:
        firmware_path: Path to the .bin firmware file (supports .zst compressed)
        output_path: Output path for .rts.png (default: same dir with .rts.png suffix)
        name: Friendly name for the firmware (default: filename)

    Returns:
        FirmwareTexture with metadata
    """
    firmware_path = Path(firmware_path)

    if not firmware_path.exists():
        raise FileNotFoundError(f"Firmware not found: {firmware_path}")

    if output_path is None:
        # Remove .zst suffix if present, then add .rts.png
        base_name = firmware_path.stem if firmware_path.suffix == '.zst' else firmware_path.name
        if firmware_path.suffix == '.zst' and '.' in base_name:
            base_name = base_name.rsplit('.', 1)[0]
        output_path = str(firmware_path.parent / f"{base_name}.rts.png")
    if name is None:
        name = firmware_path.stem
        if name.endswith('.bin'):
            name = name[:-4]

    # Read firmware (handle compressed files)
    if firmware_path.suffix == '.zst':
        # Decompress zstd
        with tempfile.NamedTemporaryFile(suffix='.bin', delete=False) as tmp:
            tmp_path = tmp.name
        try:
            subprocess.run(['zstd', '-d', '-f', str(firmware_path), '-o', tmp_path],
                         check=True, capture_output=True)
            with open(tmp_path, 'rb') as f:
                data = f.read()
        finally:
            Path(tmp_path).unlink(missing_ok=True)
    else:
        with open(firmware_path, 'rb') as f:
            data = f.read()

    # Pack into pixels
    pixels, grid_size = _pack_bytes_to_pixels(data)

    # Note: Stratum marker is embedded in the header itself
    # Pixel 0: 'FWGE' magic (F=0x46, W=0x57, G=0x47, E=0x45)
    # This identifies the texture as firmware, not executable code

    # Save as PNG
    img = Image.fromarray(pixels, mode='RGBA')
    img.save(output_path)

    checksum = hashlib.sha256(data).hexdigest()[:16]

    return FirmwareTexture(
        name=name,
        original_size=len(data),
        checksum=checksum,
        texture_path=str(output_path),
        grid_size=grid_size
    )


def extract_firmware(
    texture_path: str,
    output_path: Optional[str] = None
) -> Tuple[bytes, FirmwareTexture]:
    """
    Extract firmware binary from an RTS texture.

    Args:
        texture_path: Path to the .rts.png texture
        output_path: Optional path to write the .bin file

    Returns:
        Tuple of (binary data, metadata)
    """
    texture_path = Path(texture_path)

    if not texture_path.exists():
        raise FileNotFoundError(f"Texture not found: {texture_path}")

    # Load texture
    img = Image.open(texture_path)
    pixels = np.array(img)

    # Extract binary
    data, original_size, stored_checksum = _extract_pixels_to_bytes(pixels)

    # Verify checksum
    actual_checksum = hashlib.sha256(data).digest()[:8]
    if actual_checksum != stored_checksum:
        raise ValueError(
            f"Checksum mismatch: texture may be corrupted. "
            f"Expected {stored_checksum.hex()}, got {actual_checksum.hex()}"
        )

    # Write output if requested
    if output_path:
        with open(output_path, 'wb') as f:
            f.write(data)

    return data, FirmwareTexture(
        name=texture_path.stem,
        original_size=original_size,
        checksum=hashlib.sha256(data).hexdigest()[:16],
        texture_path=str(texture_path),
        grid_size=pixels.shape[0]
    )


def crystallize_amdgpu_firmware(
    firmware_dir: str = "/lib/firmware/amdgpu",
    output_dir: Optional[str] = None
) -> list[FirmwareTexture]:
    """
    Crystallize all AMDGPU firmware blobs from a directory.

    Common firmware files:
    - polaris10_{pfp,me,ce,mec}.bin
    - vega10_{pfp,me,ce,mec}.bin
    - raven_{pfp,me,ce,mec}.bin
    - navi10_{pfp,me,ce,mec}.bin
    etc.

    Args:
        firmware_dir: Directory containing AMD firmware .bin files
        output_dir: Output directory for .rts.png files

    Returns:
        List of FirmwareTexture metadata
    """
    firmware_dir = Path(firmware_dir)

    if not firmware_dir.exists():
        raise FileNotFoundError(f"Firmware directory not found: {firmware_dir}")

    if output_dir is None:
        output_dir = str(firmware_dir)
    else:
        Path(output_dir).mkdir(parents=True, exist_ok=True)

    results = []

    # Common AMD firmware patterns
    patterns = ["*_pfp.bin", "*_me.bin", "*_ce.bin", "*_mec.bin",
                "*_mec2.bin", "*_rlc.bin", "*_sdma.bin", "*_uvd.bin",
                "*_vce.bin", "*_smc.bin", "*_sdma1.bin"]

    for pattern in patterns:
        for fw_path in firmware_dir.glob(pattern):
            try:
                result = crystallize_firmware(
                    str(fw_path),
                    str(Path(output_dir) / f"{fw_path.stem}.rts.png")
                )
                results.append(result)
                print(f"✓ Crystallized: {result.name} "
                      f"({result.original_size} bytes → {result.grid_size}x{result.grid_size})")
            except Exception as e:
                print(f"✗ Failed: {fw_path.name} - {e}")

    return results


# C kernel extraction code template (for reference)
KERNEL_EXTRACT_CODE = """
// Extract firmware from RTS texture in VRAM
// Call this from amdgpu_init() before submitting commands

void extract_firmware_from_texture(
    volatile uint32_t *texture_base,  // VRAM address of firmware.rts.png
    uint32_t *firmware_out,           // Destination buffer
    uint32_t max_size                 // Max bytes to extract
) {
    // Read header (first 4 pixels = 16 bytes)
    uint32_t magic = texture_base[0];
    if ((magic & 0xFFFFFF) != 0x45475746) return; // "FWGE" in little-endian

    uint32_t size = texture_base[1];
    if (size > max_size) size = max_size;

    // Skip header (16 bytes = 4 pixels)
    volatile uint8_t *src = (volatile uint8_t *)(texture_base + 4);
    uint8_t *dst = (uint8_t *)firmware_out;

    for (uint32_t i = 0; i < size; i++) {
        dst[i] = src[i];
    }
}
"""

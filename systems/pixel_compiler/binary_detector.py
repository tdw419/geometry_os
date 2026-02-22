"""Binary Type Detection Module for Universal RTS Converter.

This module provides automatic detection of binary file types based on
file extensions and magic bytes. Supports GGUF, SafeTensors, WASM, ELF, PE, and Mach-O binaries.
"""
import os
from enum import Enum
from pathlib import Path
from typing import Optional


class BinaryType(Enum):
    """Enum representing detectable binary types."""
    GGUF = "gguf"
    SAFE_TENSORS = "safetensors"
    ELF_KERNEL = "elf_kernel"
    WASM = "wasm"
    PE = "pe"
    MACHO = "macho"
    GENERIC_BINARY = "generic"


# Magic byte signatures for binary format detection
MAGIC_BYTES = {
    # WASM magic bytes: \x00asm\x01\x00\x00\x00
    b"\x00asm": BinaryType.WASM,
    # ELF magic bytes (32-bit and 64-bit)
    b"\x7fELF\x01": BinaryType.ELF_KERNEL,
    b"\x7fELF\x02": BinaryType.ELF_KERNEL,
    # Windows PE (Portable Executable) magic bytes - "MZ" header
    b"MZ": BinaryType.PE,
    # Mach-O magic bytes (32-bit and 64-bit, big-endian and little-endian)
    b"\xfe\xed\xfa\xce": BinaryType.MACHO,      # 32-bit big-endian
    b"\xce\xfa\xed\xfe": BinaryType.MACHO,      # 32-bit little-endian
    b"\xfe\xed\xfa\xcf": BinaryType.MACHO,      # 64-bit big-endian
    b"\xcf\xfa\xed\xfe": BinaryType.MACHO,      # 64-bit little-endian
    b"\xca\xfe\xba\xbe": BinaryType.MACHO,      # Fat binary (multi-arch)
}


def detect_binary_type(path: str, read_magic: Optional[bytes] = None) -> BinaryType:
    """Auto-detect binary type from file extension and magic bytes.

    Args:
        path: File path to analyze. Can be a real file or just a filename.
        read_magic: Optional pre-read magic bytes. If provided and file doesn't exist,
                   these bytes are used for detection.

    Returns:
        BinaryType enum value indicating the detected type.

    Detection priority:
    1. File extension (fastest, most reliable for known formats)
    2. Magic bytes (for files without clear extensions)
    3. Default to GENERIC_BINARY if unknown
    """
    path_obj = Path(path)

    # Step 1: Check file extension first (fastest path)
    ext = path_obj.suffix.lower()

    if ext == '.gguf':
        return BinaryType.GGUF
    elif ext in ('.safetensors', '.st'):
        return BinaryType.SAFE_TENSORS
    elif ext == '.wasm':
        return BinaryType.WASM
    elif ext in ('.exe', '.dll'):
        return BinaryType.PE

    # Step 2: Read magic bytes if file exists or provided
    header: Optional[bytes] = None

    if path_obj.exists():
        try:
            with open(path_obj, 'rb') as f:
                header = f.read(8)
        except (IOError, OSError):
            # If we can't read the file, fall through to provided magic or generic
            pass

    if read_magic is not None:
        header = read_magic

    # Step 3: Check magic bytes
    if header:
        for magic, btype in MAGIC_BYTES.items():
            if header.startswith(magic):
                return btype

    # Step 4: Default to generic binary
    return BinaryType.GENERIC_BINARY

"""Tests for extended binary detection (PE and Mach-O formats) - Test-Driven Development approach."""
import pytest
import tempfile
import os
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from binary_detector import detect_binary_type, BinaryType


def test_detect_windows_pe_binary():
    """Test detection of Windows PE (Portable Executable) binary by magic bytes."""
    # PE files start with "MZ" (0x5A4D) - the DOS header signature
    result = detect_binary_type("notepad.exe", read_magic=b"MZ\x90\x00\x03\x00\x00\x00")
    assert result == BinaryType.PE


def test_detect_windows_pe_by_extension():
    """Test detection of Windows PE binary by .exe extension."""
    result = detect_binary_type("application.exe")
    assert result == BinaryType.PE


def test_detect_windows_pe_dll_extension():
    """Test detection of Windows PE DLL by .dll extension."""
    result = detect_binary_type("library.dll")
    assert result == BinaryType.PE


def test_detect_macos_macho_binary_32bit():
    """Test detection of 32-bit Mach-O binary (big-endian)."""
    # Mach-O 32-bit magic: 0xFEEDFACE (big-endian)
    result = detect_binary_type("app_macos32", read_magic=b"\xfe\xed\xfa\xce")
    assert result == BinaryType.MACHO


def test_detect_macos_macho_binary_32bit_little_endian():
    """Test detection of 32-bit Mach-O binary (little-endian)."""
    # Mach-O 32-bit magic: 0xCEFAEDFE (little-endian)
    result = detect_binary_type("app_macos32_le", read_magic=b"\xce\xfa\xed\xfe")
    assert result == BinaryType.MACHO


def test_detect_macos_macho_binary_64bit():
    """Test detection of 64-bit Mach-O binary (big-endian)."""
    # Mach-O 64-bit magic: 0xFEEDFACF (big-endian)
    result = detect_binary_type("app_macos64", read_magic=b"\xfe\xed\xfa\xcf")
    assert result == BinaryType.MACHO


def test_detect_macos_macho_binary_64bit_little_endian():
    """Test detection of 64-bit Mach-O binary (little-endian)."""
    # Mach-O 64-bit magic: 0xCFFAEDFE (little-endian)
    result = detect_binary_type("app_macos64_le", read_magic=b"\xcf\xfa\xed\xfe")
    assert result == BinaryType.MACHO


def test_detect_macos_macho_fat_binary():
    """Test detection of Mach-O fat binary (multi-architecture)."""
    # Mach-O fat binary magic: 0xCAFEBABE
    result = detect_binary_type("app_universal", read_magic=b"\xca\xfe\xba\xbe")
    assert result == BinaryType.MACHO


def test_detect_elf_32bit():
    """Test detection of 32-bit ELF binary."""
    # ELF 32-bit: 0x7F 'E' 'L' 'F' 0x01
    result = detect_binary_type("linux_app_32", read_magic=b"\x7fELF\x01\x01\x01\x00")
    assert result == BinaryType.ELF_KERNEL


def test_detect_elf_64bit():
    """Test detection of 64-bit ELF binary."""
    # ELF 64-bit: 0x7F 'E' 'L' 'F' 0x02
    result = detect_binary_type("linux_app_64", read_magic=b"\x7fELF\x02\x01\x01\x00")
    assert result == BinaryType.ELF_KERNEL


def test_detect_from_existing_file_pe():
    """Test detection from an actual PE file on disk."""
    with tempfile.NamedTemporaryFile(mode='wb', suffix='.exe', delete=False) as f:
        # Write minimal PE header (MZ magic)
        f.write(b'MZ\x90\x00\x03\x00\x00\x00')
        temp_path = f.name

    try:
        result = detect_binary_type(temp_path)
        assert result == BinaryType.PE
    finally:
        os.unlink(temp_path)


def test_detect_from_existing_file_macho():
    """Test detection from an actual Mach-O file on disk."""
    with tempfile.NamedTemporaryFile(mode='wb', suffix='', delete=False) as f:
        # Write 64-bit little-endian Mach-O magic
        f.write(b'\xcf\xfa\xed\xfe')
        temp_path = f.name

    try:
        result = detect_binary_type(temp_path)
        assert result == BinaryType.MACHO
    finally:
        os.unlink(temp_path)


def test_binary_type_enum_extended_values():
    """Test that BinaryType enum has correct string values for extended types."""
    assert BinaryType.PE.value == "pe"
    assert BinaryType.MACHO.value == "macho"


def test_pe_detection_magic_bytes_no_extension():
    """Test that PE magic bytes are detected when file has no extension."""
    # File with no extension but valid PE magic bytes
    result = detect_binary_type("windows_bin", read_magic=b"MZ\x90\x00\x03\x00\x00\x00")
    assert result == BinaryType.PE


def test_macho_detection_priority_extension_over_magic():
    """Test that file extension takes priority over magic bytes for known formats."""
    # File with .exe extension but valid Mach-O magic bytes
    # Extension (.exe) should take priority, so this is detected as PE
    result = detect_binary_type("fake.exe", read_magic=b"\xfe\xed\xfa\xce")
    assert result == BinaryType.PE  # Extension wins


def test_macho_detection_magic_bytes_no_extension():
    """Test that Mach-O magic bytes are detected when file has no extension."""
    # File with no extension but valid Mach-O magic bytes
    result = detect_binary_type("macos_bin", read_magic=b"\xfe\xed\xfa\xce")
    assert result == BinaryType.MACHO

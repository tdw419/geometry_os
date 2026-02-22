"""
Pytest configuration and fixtures for PixelRTS Blueprint Layer tests.

This module provides shared fixtures for unit, integration, and end-to-end tests.
"""

import sys
import tempfile
from pathlib import Path
from typing import Generator

import pytest
import numpy as np
from PIL import Image

# Add parent directory (pixel_compiler) to path for imports
parent_dir = Path(__file__).parent.parent
sys.path.insert(0, str(parent_dir))

from pixelrts_blueprint import (
    ComponentType,
    Permission,
    SecurityInfo,
    HilbertRange,
    Component,
    MemoryRegion,
    VisualOverlay,
    PixelRTSBlueprint,
)


# ============================================================================
# Pytest Configuration
# ============================================================================

def pytest_configure(config):
    """Register custom markers."""
    config.addinivalue_line("markers", "unit: Unit tests (fast, isolated)")
    config.addinivalue_line("markers", "integration: Integration tests (slower, may use external resources)")
    config.addinivalue_line("markers", "benchmark: Performance benchmark tests")
    config.addinivalue_line("markers", "slow: Slow-running tests")
    config.addinivalue_line("markers", "security: Security-focused tests")


# ============================================================================
# ELF Binary Fixtures
# ============================================================================

@pytest.fixture
def sample_elf_binary() -> bytes:
    """
    Create a minimal valid ELF binary for testing.

    Returns a bytes object representing a minimal 64-bit ELF executable.
    """
    # ELF header for 64-bit little-endian
    elf_header = bytearray([
        # e_ident: Magic number and other info
        0x7f, 0x45, 0x4c, 0x46,  # ELF magic
        0x02,                      # 64-bit
        0x01,                      # Little endian
        0x01,                      # ELF version
        0x00, 0x00, 0x00, 0x00,    # OS/ABI specific
        0x00, 0x00, 0x00, 0x00,    # ABI version
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # Padding
    ] + [0] * 8)  # More padding

    # Extend to full ELF header size (64 bytes)
    elf_header.extend([0] * (64 - len(elf_header)))

    # Set e_type (executable) at offset 16
    elf_header[16] = 0x02
    # Set e_machine (x86-64) at offset 18
    elf_header[18] = 0x3e
    # Set e_version
    elf_header[20] = 0x01
    # Set e_entry (entry point) - minimal
    elf_header[24:32] = (0x1000).to_bytes(8, 'little')
    # Set e_phoff (program header offset)
    elf_header[32:40] = (64).to_bytes(8, 'little')
    # Set e_shoff (section header offset)
    elf_header[40:48] = (0).to_bytes(8, 'little')
    # Set e_flags
    elf_header[48:52] = (0).to_bytes(4, 'little')
    # Set e_ehsize (ELF header size)
    elf_header[52:54] = (64).to_bytes(2, 'little')
    # Set e_phentsize (program header entry size)
    elf_header[54:56] = (56).to_bytes(2, 'little')
    # Set e_phnum (number of program headers)
    elf_header[56:58] = (1).to_bytes(2, 'little')

    # Simple program header (LOAD)
    program_header = bytearray([
        0x01, 0x00, 0x00, 0x00,  # p_type: PT_LOAD
        0x07, 0x00, 0x00, 0x00,  # p_flags: PF_X | PF_W | PF_R
    ])
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_offset
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_vaddr
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_paddr
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_filesz
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_memsz
    program_header.extend((0x1000).to_bytes(8, 'little'))  # p_align

    # Combine headers and minimal code
    elf_bytes = bytes(elf_header) + bytes(program_header)

    # Add minimal executable code (just a ret instruction + padding)
    code = b'\xc3' + b'\x00' * 0xff
    elf_bytes += code.ljust(0x1000, b'\x00')

    return elf_bytes


@pytest.fixture
def sample_elf_file(sample_elf_binary: bytes) -> Generator[Path, None, None]:
    """
    Create a temporary file containing the sample ELF binary.

    Yields a Path object to the temporary file.
    """
    with tempfile.NamedTemporaryFile(mode='wb', suffix='.elf', delete=False) as f:
        f.write(sample_elf_binary)
        temp_path = Path(f.name)

    yield temp_path

    # Cleanup
    if temp_path.exists():
        temp_path.unlink()


# ============================================================================
# PixelRTS PNG Fixtures
# ============================================================================

@pytest.fixture
def sample_rts_png() -> Generator[Path, None, None]:
    """
    Create a minimal valid .rts.png file for testing.

    The file contains a simple test pattern with embedded metadata.
    """
    # Create a simple 256x256 test pattern image
    size = 256
    data = np.zeros((size, size, 4), dtype=np.uint8)

    # Create a simple gradient pattern
    for i in range(size):
        for j in range(size):
            data[i, j] = [
                (i * 255) // size,  # R
                (j * 255) // size,  # G
                128,                # B
                255                 # A
            ]

    img = Image.fromarray(data, 'RGBA')

    # Add PNG tEXt chunks for PixelRTS v2 metadata
    from PIL import PngImagePlugin

    metadata = PngImagePlugin.PngInfo()
    metadata.add_text("PixelRTS", "v2")
    metadata.add_text("mode", "standard")
    metadata.add_text("grid_size", "256")
    metadata.add_text("bpp", "4")
    metadata.add_text("timestamp", "2026-02-10T00:00:00Z")

    with tempfile.NamedTemporaryFile(mode='wb', suffix='.rts.png', delete=False) as f:
        img.save(f, format='PNG', pnginfo=metadata)
        temp_path = Path(f.name)

    yield temp_path

    # Cleanup
    if temp_path.exists():
        temp_path.unlink()


@pytest.fixture
def sample_rts_png_with_data() -> Generator[Path, None, None]:
    """
    Create a .rts.png file with embedded binary data for testing.

    This simulates a PixelRTS container with actual content.
    """
    # Create 512x512 image
    size = 512
    data = np.random.randint(0, 256, (size, size, 4), dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    # Add comprehensive metadata
    from PIL import PngImagePlugin

    metadata = PngImagePlugin.PngInfo()
    metadata.add_text("PixelRTS", "v2")
    metadata.add_text("mode", "code")
    metadata.add_text("grid_size", "512")
    metadata.add_text("bpp", "4")
    metadata.add_text("timestamp", "2026-02-10T12:00:00Z")
    metadata.add_text("type", "kernel")
    metadata.add_text("name", "test-kernel")

    with tempfile.NamedTemporaryFile(mode='wb', suffix='.rts.png', delete=False) as f:
        img.save(f, format='PNG', pnginfo=metadata)
        temp_path = Path(f.name)

    yield temp_path

    # Cleanup
    if temp_path.exists():
        temp_path.unlink()


# ============================================================================
# Blueprint Fixtures
# ============================================================================

@pytest.fixture
def sample_hilbert_range() -> HilbertRange:
    """Create a sample HilbertRange for testing."""
    return HilbertRange(
        start_index=0,
        end_index=4096,
        pixel_start=(0, 0),
        pixel_end=(64, 64)
    )


@pytest.fixture
def sample_security_info() -> SecurityInfo:
    """Create a sample SecurityInfo for testing."""
    return SecurityInfo(
        executable=True,
        writable=False,
        signature="a1b2c3d4"
    )


@pytest.fixture
def sample_component(sample_hilbert_range: HilbertRange) -> Component:
    """Create a sample Component for testing."""
    return Component(
        id="kernel-main",
        type=ComponentType.EXECUTABLE,
        description="Main kernel executable",
        hilbert_range=sample_hilbert_range,
        entropy_profile="high",
        visual_hint="#ff0000",
        dependencies=[],
        semantic_tags=["kernel", "core", "boot"],
    )


@pytest.fixture
def sample_memory_region() -> MemoryRegion:
    """Create a sample MemoryRegion for testing."""
    return MemoryRegion(
        region=".text",
        permissions="rx",
        gpu_alignment=256
    )


@pytest.fixture
def sample_visual_overlay() -> VisualOverlay:
    """Create a sample VisualOverlay for testing."""
    return VisualOverlay(
        enabled=True,
        color_map="entropy",
        opacity=0.7,
        show_grid=True,
        show_labels=True
    )


@pytest.fixture
def sample_blueprint(
    sample_component: Component,
    sample_memory_region: MemoryRegion,
    sample_visual_overlay: VisualOverlay
) -> PixelRTSBlueprint:
    """Create a complete sample PixelRTSBlueprint for testing."""
    blueprint = PixelRTSBlueprint(
        format_version="2.0",
        original_format="elf",
        original_path="/boot/kernel.elf",
        total_size=1024 * 1024,  # 1MB
    )

    # Add components
    blueprint.add_component(sample_component)

    # Add a data component
    data_component = Component(
        id="kernel-data",
        type=ComponentType.DATA,
        description="Kernel data section",
        hilbert_range=HilbertRange(
            start_index=4096,
            end_index=8192,
            pixel_start=(64, 0),
            pixel_end=(128, 64)
        ),
        entropy_profile="medium",
        visual_hint="#00ff00",
        semantic_tags=["data", "rw"],
    )
    blueprint.add_component(data_component)

    # Add memory regions
    blueprint.add_memory_region(sample_memory_region)
    blueprint.add_memory_region(MemoryRegion(region=".data", permissions="rw"))

    # Set visual overlay
    blueprint.visual_overlay = sample_visual_overlay

    return blueprint


@pytest.fixture
def blueprint_json_file(sample_blueprint: PixelRTSBlueprint) -> Generator[Path, None, None]:
    """
    Create a temporary JSON file containing a sample blueprint.

    Yields a Path object to the temporary file.
    """
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        import json
        json.dump(sample_blueprint.to_dict(), f, indent=2)
        temp_path = Path(f.name)

    yield temp_path

    # Cleanup
    if temp_path.exists():
        temp_path.unlink()


# ============================================================================
# Temporary Directory Fixtures
# ============================================================================

@pytest.fixture
def temp_output_dir() -> Generator[Path, None, None]:
    """
    Create a temporary directory for test outputs.

    Yields a Path object to the temporary directory. The directory
    is cleaned up after the test.
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        yield Path(tmpdir)


# ============================================================================
# Test Data Fixtures
# ============================================================================

@pytest.fixture
def sample_test_data() -> bytes:
    """
    Create sample test data for encoding/decoding tests.

    Returns a bytes object with a mix of patterns (zeros, ones, random).
    """
    # Create 64KB of test data with mixed patterns
    data = bytearray()

    # Add some repeated patterns
    data.extend(b'\x00' * 1024)      # Nulls
    data.extend(b'\xff' * 1024)      # All ones
    data.extend(b'\xAA' * 1024)      # Alternating bits
    data.extend(b'\x55' * 1024)      # Inverted alternating

    # Add some structured data
    data.extend(bytes(range(256)) * 4)  # Byte sequence

    # Fill rest with semi-random but deterministic data
    import hashlib
    seed = b'PixelRTS v2 test data seed'
    hash_state = hashlib.sha256(seed)

    while len(data) < 64 * 1024:
        hash_state = hashlib.sha256(hash_state.digest())
        data.extend(hash_state.digest()[:32])

    return bytes(data[:64 * 1024])


# ============================================================================
# Benchmark Fixtures
# ============================================================================

@pytest.fixture(params=[(128, 128), (256, 256), (512, 512), (1024, 1024)])
def benchmark_image_size(request) -> tuple[int, int]:
    """
    Parametrized fixture for common image sizes used in benchmarks.

    Tests using this fixture will run once for each size.
    """
    return request.param


@pytest.fixture
def benchmark_test_images(benchmark_image_size: tuple[int, int]) -> dict[str, np.ndarray]:
    """
    Create a dictionary of test images for benchmarking.

    Returns a dict with keys: 'checkerboard', 'gradient', 'noise', 'stripes'
    """
    width, height = benchmark_image_size
    images = {}

    # Checkerboard pattern
    checkerboard = np.zeros((height, width, 4), dtype=np.uint8)
    square_size = max(1, width // 16)
    for i in range(0, height, square_size):
        for j in range(0, width, square_size):
            if ((i // square_size) + (j // square_size)) % 2 == 0:
                checkerboard[i:i+square_size, j:j+square_size] = [255, 255, 255, 255]
    images['checkerboard'] = checkerboard

    # Gradient pattern
    gradient = np.zeros((height, width, 4), dtype=np.uint8)
    for i in range(height):
        for j in range(width):
            gradient[i, j] = [
                (i * 255) // height,
                (j * 255) // width,
                128,
                255
            ]
    images['gradient'] = gradient

    # Random noise
    np.random.seed(42)
    images['noise'] = np.random.randint(0, 256, (height, width, 4), dtype=np.uint8)

    # Stripes pattern
    stripes = np.zeros((height, width, 4), dtype=np.uint8)
    stripe_width = max(1, width // 32)
    for j in range(width):
        if (j // stripe_width) % 2 == 0:
            stripes[:, j] = [255, 255, 255, 255]
    images['stripes'] = stripes

    return images

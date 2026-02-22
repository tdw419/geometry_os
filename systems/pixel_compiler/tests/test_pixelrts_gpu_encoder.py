"""
Tests for GPU-accelerated PixelRTS encoder/decoder.
"""

import pytest
import tempfile
from pathlib import Path
import sys

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Skip all tests if torch is not available
torch = pytest.importorskip("torch", reason="torch not available")


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_encoder_available():
    """Test that GPU encoder is available when CUDA is present."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    encoder = GPUPixelRTSEncoder()
    assert encoder.device.type == 'cuda'


def test_gpu_encode_decode_matches_cpu():
    """Test that GPU encoding produces same result as CPU."""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder, GPUPixelRTSDecoder
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

    # Create test data
    test_data = bytes(range(256)) * 1024  # 256KB

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        gpu_output = tmpdir / "gpu.rts.png"
        cpu_output = tmpdir / "cpu.rts.png"

        # Encode with GPU
        gpu_encoder = GPUPixelRTSEncoder()
        gpu_encoder.save(test_data, str(gpu_output))

        # Encode with CPU
        cpu_encoder = PixelRTSEncoder()
        cpu_encoder.save(test_data, str(cpu_output))

        # Both should produce valid output
        assert gpu_output.exists()
        assert cpu_output.exists()

        # Decode both and verify they match
        gpu_decoder = GPUPixelRTSDecoder()
        cpu_decoder = PixelRTSDecoder()

        gpu_data = gpu_decoder.load(str(gpu_output))
        cpu_data = cpu_decoder.load(str(cpu_output))

        assert gpu_data == test_data
        assert cpu_data == test_data
        assert gpu_data == cpu_data


def test_gpu_encoder_fallback_to_cpu():
    """Test that GPU encoder falls back to CPU when CUDA unavailable."""
    # Force CPU mode even if CUDA is available
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    encoder = GPUPixelRTSEncoder(device="cpu")
    assert encoder.device.type == 'cpu'

    # Should still work
    test_data = b'\x00\x01\x02\x03' * 1024
    with tempfile.TemporaryDirectory() as tmpdir:
        output = Path(tmpdir) / "test.rts.png"
        encoder.save(test_data, str(output))
        assert output.exists()


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_encoder_sets_gpu_encoded_flag():
    """Test that GPU encoder sets gpu_encoded flag in metadata."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    test_data = b'\x00\x01\x02\x03' * 1024

    encoder = GPUPixelRTSEncoder()
    encoder.encode(test_data)

    metadata = encoder.get_metadata()
    assert metadata is not None
    assert metadata.get('gpu_encoded') is True


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_decoder_loads_gpu_encoded_files():
    """Test that GPU decoder can load files encoded with GPU encoder."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder, GPUPixelRTSDecoder

    test_data = bytes(range(256)) * 512  # 128KB

    with tempfile.TemporaryDirectory() as tmpdir:
        output = Path(tmpdir) / "test.rts.png"

        # Encode with GPU
        encoder = GPUPixelRTSEncoder()
        encoder.save(test_data, str(output))

        # Decode with GPU decoder
        decoder = GPUPixelRTSDecoder()
        decoded_data = decoder.load(str(output))

        assert decoded_data == test_data


def test_gpu_encoder_auto_device_detection():
    """Test that GPU encoder auto-detects device."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    encoder = GPUPixelRTSEncoder()

    if torch.cuda.is_available():
        assert encoder.device.type == 'cuda'
    else:
        assert encoder.device.type == 'cpu'


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_encoder_with_metadata():
    """Test that GPU encoder preserves metadata."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder, GPUPixelRTSDecoder

    test_data = b'\x00\x01\x02\x03' * 1024
    metadata = {
        'type': 'kernel',
        'name': 'test_kernel',
        'version': '1.0.0'
    }

    with tempfile.TemporaryDirectory() as tmpdir:
        output = Path(tmpdir) / "test.rts.png"

        encoder = GPUPixelRTSEncoder()
        encoder.save(test_data, str(output), metadata=metadata)

        # Decode and check metadata
        decoder = GPUPixelRTSDecoder()
        decoder.load(str(output))

        decoded_metadata = decoder.get_metadata()
        assert decoded_metadata['type'] == 'kernel'
        assert decoded_metadata['name'] == 'test_kernel'
        assert decoded_metadata['content_version'] == '1.0.0'


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_encoder_with_explicit_grid_size():
    """Test that GPU encoder respects explicit grid size."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    test_data = b'\x00\x01\x02\x03' * 1024  # Fits in 32x32

    encoder = GPUPixelRTSEncoder()
    encoder.encode(test_data, grid_size=64)

    metadata = encoder.get_metadata()
    assert metadata['grid_size'] == 64


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_encoder_hilbert_cache():
    """Test that GPU encoder caches Hilbert LUTs."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder

    encoder = GPUPixelRTSEncoder()

    # First call generates LUT
    lut1 = encoder._get_hilbert_lut(64)
    # Second call should return cached LUT
    lut2 = encoder._get_hilbert_lut(64)

    assert lut1 is lut2  # Same object reference (cached)


def test_gpu_encoder_no_torch_error():
    """Test that GPU encoder has proper error handling in module."""
    # Just verify the module has the TORCH_AVAILABLE flag
    # and that it's set to True since torch is installed
    from systems.pixel_compiler.pixelrts_gpu_encoder import TORCH_AVAILABLE

    # Since we have torch installed, this should be True
    assert TORCH_AVAILABLE is True


@pytest.mark.skipif(
    not torch.cuda.is_available(),
    reason="CUDA not available"
)
def test_gpu_decoder_with_verify_hash():
    """Test that GPU decoder can verify hash."""
    from systems.pixel_compiler.pixelrts_gpu_encoder import GPUPixelRTSEncoder, GPUPixelRTSDecoder

    test_data = b'\x00\x01\x02\x03' * 1024

    with tempfile.TemporaryDirectory() as tmpdir:
        output = Path(tmpdir) / "test.rts.png"

        # Encode with GPU
        encoder = GPUPixelRTSEncoder()
        encoder.save(test_data, str(output))

        # Decode with hash verification
        decoder = GPUPixelRTSDecoder()
        decoded_data = decoder.load(str(output), verify_hash=True)

        assert decoded_data == test_data

"""
Blueprint Performance Tests

Tests performance targets for blueprint layer operations.
Uses manual timing for compatibility (pytest-benchmark optional).

Performance Targets:
- Analyze 1MB binary: < 1 second
- Analyze 10MB binary: < 5 seconds
- Encode/Decode 1MB: < 2 seconds
- Serialize 100 components: < 0.1 seconds
- Render overlay 1024x1024: < 1 second
"""

import pytest
import os
import time
from typing import Any

# Test data sizes
SIZE_100KB = 100 * 1024
SIZE_1MB = 1024 * 1024
SIZE_10MB = 10 * 1024 * 1024


def generate_test_data(size: int, pattern: str = "elf_header") -> bytes:
    """Generate test binary data of specified size."""
    if pattern == "elf_header":
        # Create data with ELF header for testing ELF analysis
        header = b'\x7fELF' + b'\x02' + b'\x01' + b'\x01' + b'\x00' * 9
        return header + os.urandom(size - len(header))
    else:
        return os.urandom(size)


def create_test_blueprint(num_components: int = 100) -> Any:
    """Create a test blueprint with specified number of components."""
    from systems.pixel_compiler.pixelrts_blueprint import (
        PixelRTSBlueprint, Component, ComponentType, HilbertRange,
        MemoryRegion
    )

    blueprint = PixelRTSBlueprint(
        system_name="test_system",
        system_type="kernel",
        architecture="x86_64"
    )

    # Add components
    for i in range(num_components):
        component = Component(
            id=f"component_{i}",
            type=ComponentType.EXECUTABLE if i % 2 == 0 else ComponentType.DATA,
            description=f"Test component {i}",
            hilbert_range=HilbertRange(
                start_index=i * 1000,
                end_index=(i + 1) * 1000,
                pixel_start=(i % 64, i // 64),
                pixel_end=((i + 1) % 64, (i + 1) // 64)
            ),
            entropy_profile="medium" if i % 3 == 0 else "low",
            visual_hint="red_dominant" if i % 2 == 0 else "green_dominant",
            dependencies=[f"component_{j}" for j in range(max(0, i - 2), i)],
            semantic_tags=["test", f"tag_{i % 5}"]
        )
        blueprint.components.append(component)

    # Add memory regions
    for region_name in [".text", ".data", ".rodata", ".bss"]:
        blueprint.memory_map.append(
            MemoryRegion(region=region_name, permissions="rx" if region_name == ".text" else "rw")
        )

    blueprint.entry_point = "0x1000"

    return blueprint


class TestBlueprintPerformance:
    """Performance test suite for blueprint layer operations."""

    def test_analyze_100kb_performance(self):
        """Test analysis of 100KB binary completes in reasonable time."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_100KB, pattern="elf_header")
        analyzer = BlueprintAnalyzer()

        start = time.perf_counter()
        result = analyzer.analyze(
            data,
            system_name="test_system",
            system_type="kernel",
            architecture="x86_64"
        )
        elapsed = time.perf_counter() - start

        # Should complete in less than 500ms for 100KB
        assert elapsed < 0.5, f"100KB analysis took {elapsed:.3f}s, target is < 0.5s"
        assert result is not None
        assert hasattr(result, 'components')

    @pytest.mark.slow
    def test_analyze_1mb_target(self):
        """
        Test analysis of 1MB binary meets performance target.
        Target: < 1 second
        """
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_1MB, pattern="elf_header")
        analyzer = BlueprintAnalyzer()

        start = time.perf_counter()
        blueprint = analyzer.analyze(
            data,
            system_name="test_system",
            system_type="kernel",
            architecture="x86_64"
        )
        elapsed = time.perf_counter() - start

        # Performance target: 1MB analysis in < 1 second
        assert elapsed < 1.0, f"1MB analysis took {elapsed:.3f}s, target is < 1.0s"
        assert len(blueprint.components) > 0

    @pytest.mark.slow
    def test_analyze_10mb_target(self):
        """
        Test analysis of 10MB binary meets performance target.
        Target: < 5 seconds
        """
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_10MB, pattern="elf_header")
        analyzer = BlueprintAnalyzer()

        start = time.perf_counter()
        blueprint = analyzer.analyze(
            data,
            system_name="test_system",
            system_type="kernel",
            architecture="x86_64"
        )
        elapsed = time.perf_counter() - start

        # Performance target: 10MB analysis in < 5 seconds
        assert elapsed < 5.0, f"10MB analysis took {elapsed:.3f}s, target is < 5.0s"

    def test_encode_100kb_performance(self):
        """Test encoding of 100KB data."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

        data = generate_test_data(SIZE_100KB, pattern="random")
        encoder = PixelRTSEncoder(mode="standard")

        start = time.perf_counter()
        result = encoder.encode(data, metadata={"type": "test"})
        elapsed = time.perf_counter() - start

        assert elapsed < 0.5, f"100KB encoding took {elapsed:.3f}s, target is < 0.5s"
        assert result is not None
        assert isinstance(result, bytes)
        assert len(result) > 0

    @pytest.mark.slow
    def test_encode_1mb_target(self):
        """
        Test encoding of 1MB data meets performance target.
        Target: < 2 seconds
        """
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

        data = generate_test_data(SIZE_1MB, pattern="random")
        encoder = PixelRTSEncoder(mode="standard")

        start = time.perf_counter()
        png_data = encoder.encode(data, metadata={"type": "test"})
        elapsed = time.perf_counter() - start

        # Performance target: 1MB encoding in < 2 seconds
        assert elapsed < 2.0, f"1MB encoding took {elapsed:.3f}s, target is < 2.0s"

    @pytest.mark.slow
    def test_decode_1mb_target(self):
        """
        Test decoding of 1MB PNG meets performance target.
        Target: < 2 seconds
        """
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

        # First encode the data
        data = generate_test_data(SIZE_1MB, pattern="random")
        encoder = PixelRTSEncoder(mode="standard")
        png_data = encoder.encode(data, metadata={"type": "test"})

        decoder = PixelRTSDecoder()
        decoder.set_metadata(encoder.get_metadata())

        start = time.perf_counter()
        decoded_data = decoder.decode(png_data)
        elapsed = time.perf_counter() - start

        # Performance target: 1MB decoding in < 2 seconds
        assert elapsed < 2.0, f"1MB decoding took {elapsed:.3f}s, target is < 2.0s"
        assert len(decoded_data) == len(data)

    def test_serialize_10_components(self):
        """Test serialization of 10 components."""
        blueprint = create_test_blueprint(10)

        start = time.perf_counter()
        result = blueprint.to_json()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"10 component serialization took {elapsed:.4f}s"
        assert result is not None
        assert isinstance(result, str)

    def test_serialize_50_components(self):
        """Test serialization of 50 components."""
        blueprint = create_test_blueprint(50)

        start = time.perf_counter()
        result = blueprint.to_json()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.05, f"50 component serialization took {elapsed:.4f}s"

    @pytest.mark.slow
    def test_serialize_100_target(self):
        """
        Test serialization of 100 components meets performance target.
        Target: < 0.1 seconds (100ms)
        """
        blueprint = create_test_blueprint(100)

        start = time.perf_counter()
        json_str = blueprint.to_json()
        elapsed = time.perf_counter() - start

        # Performance target: 100 components in < 0.1 seconds
        assert elapsed < 0.1, f"100 component serialization took {elapsed:.4f}s, target is < 0.1s"

    def test_deserialize_100_components(self):
        """Test deserialization of 100 components."""
        blueprint = create_test_blueprint(100)
        json_str = blueprint.to_json()

        from systems.pixel_compiler.pixelrts_blueprint import PixelRTSBlueprint

        start = time.perf_counter()
        result = PixelRTSBlueprint.from_json(json_str)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.1, f"100 component deserialization took {elapsed:.4f}s"
        assert result is not None
        assert len(result.components) == 100

    def test_entropy_calculation_performance(self):
        """Test entropy calculation performance."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_1MB, pattern="random")
        analyzer = BlueprintAnalyzer()

        start = time.perf_counter()
        result = analyzer._calculate_entropy(data)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.5, f"Entropy calculation took {elapsed:.3f}s"
        assert 0 <= result <= 8  # Entropy is between 0 and 8

    def test_entropy_regions_performance(self):
        """Test entropy regions calculation performance."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_1MB, pattern="random")
        analyzer = BlueprintAnalyzer()

        start = time.perf_counter()
        result = analyzer.calculate_entropy_regions(data)
        elapsed = time.perf_counter() - start

        assert elapsed < 1.0, f"Entropy regions calculation took {elapsed:.3f}s"
        assert len(result) > 0

    def test_hilbert_curve_generation(self):
        """Test Hilbert curve LUT generation performance."""
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        # Test with 256x256 (order 8) which is more common for quick operations
        start = time.perf_counter()
        curve = HilbertCurve(order=8)  # 256x256
        result = curve.generate_lut()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.2, f"Hilbert curve generation took {elapsed:.3f}s"
        assert len(result) == 256 * 256

    def test_grid_size_calculation(self):
        """Test grid size calculation performance."""
        from systems.pixel_compiler.pixelrts_v2_core import calculate_grid_size

        sizes = [SIZE_100KB, SIZE_1MB, SIZE_10MB]

        start = time.perf_counter()
        result = [calculate_grid_size(s) for s in sizes]
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"Grid size calculation took {elapsed:.4f}s"
        assert len(result) == 3

    @pytest.mark.slow
    def test_roundtrip_encode_decode_1mb(self):
        """Test complete encode/decode roundtrip for 1MB."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

        data = generate_test_data(SIZE_1MB, pattern="random")

        start = time.perf_counter()
        encoder = PixelRTSEncoder(mode="standard")
        png_data = encoder.encode(data, metadata={"type": "test"})

        decoder = PixelRTSDecoder()
        decoder.set_metadata(encoder.get_metadata())
        result = decoder.decode(png_data)
        elapsed = time.perf_counter() - start

        assert elapsed < 4.0, f"Roundtrip took {elapsed:.3f}s, target is < 4.0s"
        assert result == data

    def test_blueprint_to_dict_performance(self):
        """Test blueprint to_dict conversion performance."""
        blueprint = create_test_blueprint(100)

        start = time.perf_counter()
        result = blueprint.to_dict()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.1, f"to_dict took {elapsed:.4f}s"
        assert result is not None
        assert "components" in result

    def test_blueprint_from_dict_performance(self):
        """Test blueprint from_dict conversion performance."""
        blueprint = create_test_blueprint(100)
        data = blueprint.to_dict()

        from systems.pixel_compiler.pixelrts_blueprint import PixelRTSBlueprint

        start = time.perf_counter()
        result = PixelRTSBlueprint.from_dict(data)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.1, f"from_dict took {elapsed:.4f}s"
        assert len(result.components) == 100

    def test_metadata_encoding_performance(self):
        """Test metadata encoding performance."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata

        metadata = PixelRTSMetadata.create_metadata(
            grid_size=1024,
            encoding_mode="RGBA-dense",
            segments={"kernel": {"offset": 0, "size": SIZE_1MB}}
        )

        start = time.perf_counter()
        result = PixelRTSMetadata.encode_png_text(metadata)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"Metadata encoding took {elapsed:.4f}s"
        assert result is not None
        assert result.startswith(b"PixelRTS")

    def test_metadata_decoding_performance(self):
        """Test metadata decoding performance."""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata

        metadata = PixelRTSMetadata.create_metadata(
            grid_size=1024,
            encoding_mode="RGBA-dense"
        )
        encoded = PixelRTSMetadata.encode_png_text(metadata)

        start = time.perf_counter()
        result = PixelRTSMetadata.decode_png_text(encoded)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"Metadata decoding took {elapsed:.4f}s"
        assert result["grid_size"] == 1024

    @pytest.mark.slow
    def test_memory_usage_analyze_1mb(self):
        """Test memory usage for 1MB analysis."""
        import tracemalloc

        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        data = generate_test_data(SIZE_1MB, pattern="elf_header")
        analyzer = BlueprintAnalyzer()

        tracemalloc.start()
        result = analyzer.analyze(data)
        current, peak = tracemalloc.get_traced_memory()
        tracemalloc.stop()

        memory_mb = peak / (1024 * 1024)

        # Memory usage should be reasonable (< 100MB for 1MB input)
        assert memory_mb < 100, f"Memory usage {memory_mb:.2f}MB exceeds 100MB limit"
        assert result is not None


if __name__ == "__main__":
    # Run tests with pytest
    pytest.main([__file__, "-v"])

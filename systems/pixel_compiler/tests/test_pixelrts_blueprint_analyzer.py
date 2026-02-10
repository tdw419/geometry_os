"""Tests for PixelRTS blueprint analyzer."""

import pytest
import tempfile
from pathlib import Path
from pixelrts_blueprint_analyzer import BlueprintAnalyzer
from pixelrts_blueprint import PixelRTSBlueprint


def test_analyzer_creates_blueprint_from_binary():
    """Test analyzer creates blueprint from binary data."""
    analyzer = BlueprintAnalyzer()

    # Create simple test data with identifiable patterns
    test_data = b'\x7fELF' + b'\x00' * 100  # ELF header

    blueprint = analyzer.analyze(test_data, system_name="Test Binary")

    assert isinstance(blueprint, PixelRTSBlueprint)
    assert blueprint.system_name == "Test Binary"


def test_analyzer_detects_elf_binary():
    """Test analyzer correctly identifies ELF binaries."""
    analyzer = BlueprintAnalyzer()

    elf_header = b'\x7fELF\x02\x01\x01\x00' + b'\x00' * 100
    is_elf = analyzer.is_elf_binary(elf_header)

    assert is_elf is True


def test_analyzer_rejects_non_elf_binary():
    """Test analyzer correctly rejects non-ELF binaries."""
    analyzer = BlueprintAnalyzer()

    non_elf = b'PK\x03\x04'  # ZIP header
    is_elf = analyzer.is_elf_binary(non_elf)

    assert is_elf is False


def test_analyzer_calculates_entropy_regions():
    """Test analyzer calculates entropy for data regions."""
    analyzer = BlueprintAnalyzer()

    # Create data with varying entropy
    low_entropy = b'\x00' * 1000
    high_entropy = bytes(range(256)) * 4  # All byte values
    test_data = low_entropy + high_entropy

    regions = analyzer.calculate_entropy_regions(test_data, window_size=256)

    assert len(regions) > 0
    assert any(r.entropy_profile == 'low' for r in regions)
    assert any(r.entropy_profile == 'high' for r in regions)


def test_analyzer_entropy_calculation_accuracy():
    """Test entropy calculation produces expected values."""
    analyzer = BlueprintAnalyzer()

    # All zeros = minimum entropy
    zeros = b'\x00' * 1000
    zeros_entropy = analyzer._calculate_entropy(zeros)
    assert zeros_entropy < 0.1

    # All byte values = maximum entropy
    full_range = bytes(range(256)) * 4
    full_entropy = analyzer._calculate_entropy(full_range)
    assert full_entropy > 7.5

    # Repeating pattern = medium entropy
    pattern = b'ABCDEFGH' * 125
    pattern_entropy = analyzer._calculate_entropy(pattern)
    assert 2.0 < pattern_entropy < 7.5


def test_analyzer_infer_memory_map():
    """Test memory map inference for binary."""
    analyzer = BlueprintAnalyzer()

    test_data = b'\x7fELF' + b'\x00' * 10000
    memory_map = analyzer._infer_memory_map(test_data)

    assert len(memory_map) > 0
    # Should have default regions
    region_names = [r.region for r in memory_map]
    assert '.text' in region_names
    assert '.data' in region_names


def test_analyzer_entropy_to_profile_mapping():
    """Test entropy value to profile category mapping."""
    analyzer = BlueprintAnalyzer()

    # Test low entropy threshold
    assert analyzer._entropy_to_profile(1.5) == 'low'
    # Test medium entropy range
    assert analyzer._entropy_to_profile(5.0) == 'medium'
    # Test high entropy threshold
    assert analyzer._entropy_to_profile(8.0) == 'high'


def test_analyzer_with_empty_data():
    """Test analyzer handles empty data gracefully."""
    analyzer = BlueprintAnalyzer()

    blueprint = analyzer.analyze(b'', system_name="Empty")

    assert isinstance(blueprint, PixelRTSBlueprint)
    assert blueprint.system_name == "Empty"


def test_analyzer_entropy_region_with_small_data():
    """Test entropy regions with data smaller than window size."""
    analyzer = BlueprintAnalyzer()

    small_data = b'\x7fELF' + b'\x00' * 100
    regions = analyzer.calculate_entropy_regions(small_data, window_size=4096)

    # Should still produce at least one region
    assert len(regions) >= 1


def test_analyzer_elf_header_detection_short_data():
    """Test ELF detection rejects data shorter than header."""
    analyzer = BlueprintAnalyzer()

    short_data = b'\x7fEL'  # Only 3 bytes
    is_elf = analyzer.is_elf_binary(short_data)

    assert is_elf is False


def test_analyzer_entropy_zero_length():
    """Test entropy calculation for zero-length data."""
    analyzer = BlueprintAnalyzer()

    entropy = analyzer._calculate_entropy(b'')
    assert entropy == 0.0


def test_analyzer_entropy_to_visual_hint_mapping():
    """Test entropy profile to visual hint mapping."""
    analyzer = BlueprintAnalyzer()

    assert analyzer._entropy_to_visual_hint('low') == 'dark_blue'
    assert analyzer._entropy_to_visual_hint('medium') == 'textured_green'
    assert analyzer._entropy_to_visual_hint('high') == 'red_dominant'
    assert analyzer._entropy_to_visual_hint('unknown') == 'gray'


def test_analyzer_creates_components_from_entropy_analysis():
    """Test analyzer creates components when falling back to entropy analysis."""
    analyzer = BlueprintAnalyzer()

    # Non-ELF data should trigger entropy-based analysis
    test_data = b'NOT_ELF' + b'\x00' * 1000 + bytes(range(256)) * 10

    blueprint = analyzer.analyze(test_data, system_name="Entropy Test")

    assert len(blueprint.components) > 0
    # Components should have valid HilbertRanges
    for comp in blueprint.components:
        assert comp.hilbert_range.start_index >= 0
        assert comp.hilbert_range.end_index >= comp.hilbert_range.start_index


def test_analyzer_custom_entropy_thresholds():
    """Test analyzer respects custom entropy thresholds."""
    analyzer = BlueprintAnalyzer()

    # Verify thresholds are set correctly
    assert analyzer.entropy_threshold_low == 2.0
    assert analyzer.entropy_threshold_high == 7.5
    assert analyzer.entropy_window_size == 4096


def test_analyzer_entropy_region_attributes():
    """Test entropy regions have correct attributes."""
    analyzer = BlueprintAnalyzer()

    test_data = b'\x00' * 500 + bytes(range(256)) * 2
    regions = analyzer.calculate_entropy_regions(test_data, window_size=256)

    assert len(regions) > 0

    # Check first region (low entropy)
    first_region = regions[0]
    assert first_region.offset == 0
    assert first_region.size > 0
    assert 0.0 <= first_region.entropy <= 8.0
    assert first_region.entropy_profile in ['low', 'medium', 'high']


def test_analyzer_with_all_same_byte():
    """Test entropy calculation for data with all same byte value."""
    analyzer = BlueprintAnalyzer()

    # All 0xFF bytes should have near-zero entropy
    all_same = b'\xFF' * 1000
    entropy = analyzer._calculate_entropy(all_same)
    assert entropy < 0.01


def test_analyzer_entropy_at_threshold_boundaries():
    """Test entropy classification at threshold boundaries."""
    analyzer = BlueprintAnalyzer()

    # At or above low threshold (2.0) goes to medium
    assert analyzer._entropy_to_profile(2.0) == 'medium'

    # At or above high threshold (7.5) goes to high
    assert analyzer._entropy_to_profile(7.5) == 'high'

    # Just below high threshold
    assert analyzer._entropy_to_profile(7.49) == 'medium'

    # Just below low threshold
    assert analyzer._entropy_to_profile(1.99) == 'low'


def test_analyzer_memory_map_permissions():
    """Test memory map regions have correct permissions."""
    analyzer = BlueprintAnalyzer()

    memory_map = analyzer._infer_memory_map(b'ELF_TEST_DATA')

    # Check that each region has a valid permission string
    for region in memory_map:
        assert len(region.permissions) >= 1
        assert all(p in 'rwx' for p in region.permissions)
        assert region.region.startswith('.')


def test_analyzer_blueprint_serialization():
    """Test blueprint can be serialized and deserialized."""
    analyzer = BlueprintAnalyzer()

    test_data = b'\x7fELF' + b'\x00' * 1000
    blueprint = analyzer.analyze(test_data, system_name="Serialization Test")

    # Serialize to dict
    blueprint_dict = blueprint.to_dict()
    assert blueprint_dict['system_name'] == "Serialization Test"
    assert 'components' in blueprint_dict
    assert 'memory_map' in blueprint_dict

    # Deserialize from dict
    restored = PixelRTSBlueprint.from_dict(blueprint_dict)
    assert restored.system_name == blueprint.system_name
    assert len(restored.components) == len(blueprint.components)

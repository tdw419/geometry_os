"""Tests for PixelRTS blueprint metadata encoding/decoding."""

import pytest
import sys
from pathlib import Path

# Add pixel_compiler to path for direct imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_v2_core import PixelRTSMetadata
from pixelrts_blueprint import PixelRTSBlueprint, Component, ComponentType, HilbertRange

def test_encode_blueprint_to_png_text():
    """Test encoding blueprint to PNG tEXt chunk format."""
    blueprint = PixelRTSBlueprint(
        system_name="Test System",
        components=[
            Component(
                id="test",
                type=ComponentType.DATA,
                description="Test component",
                hilbert_range=HilbertRange(0, 100, (0, 0), (10, 10)),
                entropy_profile="low",
                visual_hint="blue"
            )
        ]
    )

    encoded = PixelRTSMetadata.encode_blueprint(blueprint)

    assert isinstance(encoded, bytes)
    assert encoded.startswith(b"PixelRTS-Blueprint")

def test_decode_blueprint_from_png_text():
    """Test decoding blueprint from PNG tEXt chunk format."""
    blueprint_dict = {
        "blueprint_version": "1.0",
        "system_name": "Test System",
        "system_type": "",
        "architecture": "",
        "components": [],
        "memory_map": [],
        "entry_point": None,
        "visual_overlay": {
            "grid_overlay": True,
            "color_key": "semantic",
            "legend": "",
            "highlight_boundaries": True,
            "boundary_color": [255, 255, 0, 128]
        }
    }

    import json
    json_bytes = PixelRTSMetadata.BLUEPRINT_MAGIC + json.dumps(blueprint_dict).encode("utf-8")

    decoded = PixelRTSMetadata.decode_blueprint(json_bytes)

    assert isinstance(decoded, dict)
    assert decoded["system_name"] == "Test System"

def test_blueprint_magic_constant():
    """Test blueprint magic constant is defined correctly."""
    assert PixelRTSMetadata.BLUEPRINT_MAGIC == b"PixelRTS-Blueprint"

def test_encode_decode_roundtrip():
    """Test blueprint survives encode/decode roundtrip."""
    original = PixelRTSBlueprint(
        system_name="Roundtrip Test",
        system_type="Test Container",
        architecture="x86_64",
        entry_point="0x1000"
    )

    encoded = PixelRTSMetadata.encode_blueprint(original)
    decoded_dict = PixelRTSMetadata.decode_blueprint(encoded)
    restored = PixelRTSBlueprint.from_dict(decoded_dict)

    assert restored.system_name == original.system_name
    assert restored.system_type == original.system_type
    assert restored.architecture == original.architecture
    assert restored.entry_point == original.entry_point

def test_decode_invalid_magic_raises_error():
    """Test decoding with invalid magic bytes raises ValueError."""
    invalid = b"WrongMagic-Blueprint" + b"{}"

    with pytest.raises(ValueError, match="Not a PixelRTS blueprint"):
        PixelRTSMetadata.decode_blueprint(invalid)

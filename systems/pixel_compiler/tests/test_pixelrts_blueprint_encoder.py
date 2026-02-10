"""Tests for blueprint integration in PixelRTSEncoder."""

import pytest
import tempfile
from pathlib import Path
import sys

# Add pixel_compiler to path for direct imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_v2_core import PixelRTSEncoder, PixelRTSMetadata
from pixelrts_blueprint import (
    PixelRTSBlueprint, Component, ComponentType, HilbertRange
)

def test_encode_with_blueprint_embeds_in_png():
    """Test encoding with blueprint embeds blueprint in PNG tEXt chunk."""
    encoder = PixelRTSEncoder(mode="standard")

    blueprint = PixelRTSBlueprint(
        system_name="Test OS",
        system_type="Linux Kernel",
        architecture="x86_64"
    )

    data = b"Test data for blueprint encoding"
    png_bytes = encoder.encode(data, blueprint=blueprint.to_dict())

    # Verify PNG was created
    assert png_bytes[:8] == b'\x89PNG\r\n\x1a\n'

    # Verify blueprint is embedded in PNG
    from PIL import Image
    from io import BytesIO
    image = Image.open(BytesIO(png_bytes))

    # Check for PixelRTS-Blueprint tEXt chunk
    blueprint_found = False
    for key, value in image.text.items():
        if "PixelRTS-Blueprint" in key:
            blueprint_found = True
            # Verify we can decode it
            decoded = PixelRTSMetadata.decode_blueprint(value.encode("utf-8"))
            assert decoded["system_name"] == "Test OS"
            break

    assert blueprint_found, "Blueprint not found in PNG tEXt chunks"

def test_encode_with_blueprint_saves_sidecar():
    """Test encoding with blueprint saves sidecar blueprint JSON."""
    encoder = PixelRTSEncoder(mode="standard")

    blueprint = PixelRTSBlueprint(
        system_name="Test OS",
        system_type="Linux Kernel",
        architecture="x86_64"
    )

    with tempfile.TemporaryDirectory() as tmpdir:
        output_path = Path(tmpdir) / "test.rts.png"
        sidecar_path = Path(tmpdir) / "test.meta.json"
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"

        data = b"Test data for blueprint encoding"
        encoder.save(data, str(output_path), blueprint=blueprint.to_dict())

        # Verify files were created
        assert output_path.exists()
        assert sidecar_path.exists()
        assert blueprint_path.exists()

        # Verify blueprint content
        import json
        with open(blueprint_path) as f:
            saved_blueprint = json.load(f)

        assert saved_blueprint["system_name"] == "Test OS"

def test_encode_without_blueprint_skips_sidecar():
    """Test encoding without blueprint does not create blueprint sidecar."""
    encoder = PixelRTSEncoder(mode="standard")

    with tempfile.TemporaryDirectory() as tmpdir:
        output_path = Path(tmpdir) / "test.rts.png"
        blueprint_path = Path(tmpdir) / "test.rts.png.blueprint.json"

        data = b"Test data"
        encoder.save(data, str(output_path))

        # Verify PNG was created but blueprint sidecar was not
        assert output_path.exists()
        assert not blueprint_path.exists()

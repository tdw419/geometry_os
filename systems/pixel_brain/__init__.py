# systems/pixel_brain/__init__.py
"""PixelBrain Visual Training Harness.

This module provides components for training PixelBrain as a native
Geometry OS intelligence using visual-first training via Hilbert Curve encoding.

Vocabulary:
- 0-31: Reserved (control codes)
- 32-126: ASCII printable (Prompt vocabulary)
- 200-214: GlyphStratum Opcodes (Logic vocabulary)
- 256-511: Byte literals 0-255 (Operand vocabulary)
- 512-1023: Intent glyphs (Stratum 4 metadata)
"""

__version__ = "0.1.0"

# Import key components for convenience
from systems.pixel_brain.constants import (
    OPCODE_BASE,
    OPCODE_NOP,
    OPCODE_ALLOC,
    OPCODE_HALT,
    VOCAB_SIZE,
    TEXTURE_SIZE,
)
from systems.pixel_brain.hilbert_encoder import HilbertEncoder
from systems.pixel_brain.atlas_tokenizer import AtlasTokenizer
from systems.pixel_brain.synthetic_dataset_generator import (
    SyntheticDatasetGenerator,
    generate_allocation_seed_dataset,
)

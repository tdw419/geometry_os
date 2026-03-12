"""
Constants for the PixelBrain Visual Training Harness.
Defines the vocabulary and spatial dimensions for Geometry OS native intelligence.
"""

# --- TOKEN VOCABULARY (Atlas Indices) ---
# Standard ASCII (32-126) for Prompts
ASCII_START = 32
ASCII_END = 126

# GlyphStratum Opcodes (200-214) from systems/infinite_map_rs/src/glyph_stratum/mod.rs
OPCODE_BASE = 200
OPCODE_NOP = 200     # 0
OPCODE_ALLOC = 201   # 1
OPCODE_FREE = 202    # 2
OPCODE_LOAD = 203    # 3
OPCODE_STORE = 204   # 4
OPCODE_ADD = 205     # 5
OPCODE_SUB = 206     # 6
OPCODE_MUL = 207     # 7
OPCODE_DIV = 208     # 8
OPCODE_JUMP = 209    # 9
OPCODE_BRANCH = 210  # 10
OPCODE_CALL = 211    # 11
OPCODE_RETURN = 212  # 12
OPCODE_HALT = 213    # 13 (CRITICAL: Reviewer fixed this from 215)
OPCODE_DATA = 214    # 14

# Raw Byte Literals (256-511) for Operands (0-255)
BYTE_LITERAL_START = 256
BYTE_LITERAL_END = 511

# Intent/Metadata Glyphs (512+)
INTENT_GLYPH_START = 512
GLYPH_BRAIN = 192    # Existing brain icon
GLYPH_SPIRAL = 193   # Hilbert spiral

# --- SPATIAL DIMENSIONS ---
# Training Texture is 256x256
TEXTURE_SIZE = 256

# Quadrant-based partitioning (128x128 regions)
QUADRANT_SIZE = 128
QUADRANT_PIXELS = 16384  # 128 * 128

# Hilbert Curve order for 256x256 is 8 (2^8 = 256)
HILBERT_ORDER = 8
TOTAL_STEPS = 65536      # 256 * 256

# --- REGION MAPPING (Hilbert Step Ranges) ---
# Note: These are rough estimates. Actual training data will use 
# precise Hilbert-to-XY mapping to fill regions.
PROMPT_STEPS = (0, 16383)           # Q0: Top-Left
INTENT_STEPS = (16384, 32767)       # Q1: Top-Right
CODE_STEPS = (32768, 49151)         # Q2: Bottom-Left
TERMINUS_STEPS = (49152, 65535)     # Q3: Bottom-Right

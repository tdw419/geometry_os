# systems/pixel_brain/constants.py
"""Constants for PixelBrain Visual Training Harness.

These constants define the token vocabulary and texture dimensions
for training PixelBrain on Geometry OS spatial programs.

Reference: systems/infinite_map_rs/src/glyph_stratum/mod.rs
"""

# =============================================================================
# GLYPHSTRATUM OPCODES
# =============================================================================

# Base offset for GlyphStratum opcodes (Unicode 200-214)
OPCODE_BASE = 200

# Individual opcodes: OPCODE_BASE + opcode_value
OPCODE_NOP = 200      # Nop = 200 + 0
OPCODE_ALLOC = 201    # Alloc = 200 + 1
OPCODE_FREE = 202     # Free = 200 + 2
OPCODE_LOAD = 203     # Load = 200 + 3
OPCODE_STORE = 204    # Store = 200 + 4
OPCODE_ADD = 205      # Add = 200 + 5
OPCODE_SUB = 206      # Sub = 200 + 6
OPCODE_MUL = 207      # Mul = 200 + 7
OPCODE_DIV = 208      # Div = 200 + 8
OPCODE_JUMP = 209     # Jump = 200 + 9
OPCODE_BRANCH = 210   # Branch = 200 + 10
OPCODE_CALL = 211     # Call = 200 + 11
OPCODE_RETURN = 212   # Return = 200 + 12
OPCODE_HALT = 213     # Halt = 200 + 13
OPCODE_DATA = 214     # Data = 200 + 14

# =============================================================================
# TOKEN VOCABULARY BOUNDARIES
# =============================================================================

# ASCII printable characters (Prompt vocabulary)
ASCII_START = 32
ASCII_END = 126

# GlyphStratum opcodes (Logic vocabulary)
OPCODE_START = 200
OPCODE_END = 214

# Raw byte literals 0-255 (Operand vocabulary)
BYTE_LITERAL_START = 256
BYTE_LITERAL_END = 511

# Intent glyphs (Stratum 4 metadata)
INTENT_GLYPH_START = 512

# Total vocabulary size
VOCAB_SIZE = 1024

# =============================================================================
# TRAINING TEXTURE DIMENSIONS
# =============================================================================

# Training texture is 256x256 pixels
TEXTURE_SIZE = 256

# Each quadrant is 128x128 pixels
QUADRANT_SIZE = 128

# Pixels per quadrant
QUADRANT_PIXELS = QUADRANT_SIZE * QUADRANT_SIZE  # 16384

# Total pixels in texture
TOTAL_PIXELS = TEXTURE_SIZE * TEXTURE_SIZE  # 65536

# =============================================================================
# QUADRANT OFFSETS (Hilbert step ranges)
# =============================================================================

# Q0: Prompt region (steps 0-16383)
Q0_START = 0
Q0_END = QUADRANT_PIXELS - 1  # 16383

# Q1: Intent/Spec region (steps 16384-32767)
Q1_START = QUADRANT_PIXELS  # 16384
Q1_END = 2 * QUADRANT_PIXELS - 1  # 32767

# Q2: Memory/Substrate region (steps 32768-49151)
Q2_START = 2 * QUADRANT_PIXELS  # 32768
Q2_END = 3 * QUADRANT_PIXELS - 1  # 49151

# Q3: Terminus/Stability region (steps 49152-65535)
Q3_START = 3 * QUADRANT_PIXELS  # 49152
Q3_END = 4 * QUADRANT_PIXELS - 1  # 65535

# =============================================================================
# COLOR DEFINITIONS
# =============================================================================

# Standard colors for fill operations (RGB tuples)
COLORS = {
    "RED": (255, 0, 0),
    "GREEN": (0, 255, 0),
    "BLUE": (0, 0, 255),
    "YELLOW": (255, 255, 0),
    "CYAN": (0, 255, 255),
    "MAGENTA": (255, 0, 255),
}

# =============================================================================
# TASK GRAMMAR
# =============================================================================

# Available sizes for ALLOC tasks
ALLOC_SIZES = [(2, 2), (4, 4), (8, 8), (16, 16), (4, 8), (8, 4)]

# Available colors for fill operations
ALLOC_COLORS = list(COLORS.keys())

# Grid-aligned positions for allocations
ALLOC_POSITIONS = list(range(0, 240, 16))

# Target dataset size
TARGET_DATASET_SIZE = 1000

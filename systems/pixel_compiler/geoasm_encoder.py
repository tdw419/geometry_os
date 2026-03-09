"""
GeoASM Semantic Encoder

Encodes GeoASM neural assembly instructions to RGBA pixels with semantic coloring:
- Red = Opcode (0xD0-0xD6) scaled by compute heat intensity
- Green = Source Register (Rs: R0-R7)
- Blue = Destination Register (Rd: R0-R7)
- Alpha = Immediate Value (0-255)

Supports two modes:
1. Semantic mode (default): Heat-scaled opcodes for visual intelligibility
2. Lossless mode: Exact opcode values for perfect roundtrip
"""

from typing import List, Dict
import numpy as np

from systems.visual_shell.geoasm import Instruction, Opcode


# Heat intensity mapping for semantic encoding
# Higher values = brighter red = more compute
HEAT_INTENSITY: Dict[Opcode, float] = {
    Opcode.ATTEND: 1.0,        # Brightest (most compute - self-attention)
    Opcode.PROJECT: 0.9,       # High (FFN)
    Opcode.THOUGHT_PULSE: 0.8, # High (visual output)
    Opcode.SAMPLE: 0.7,        # Medium-high
    Opcode.EMBED: 0.6,         # Medium (token loading)
    Opcode.KV_APPEND: 0.5,     # Medium
    Opcode.LAYER: 0.3,         # Low (control)
}


class GeoASMEncoder:
    """
    Encoder for GeoASM instructions to RGBA pixels.

    Provides two encoding modes:
    - Semantic (default): Opcode scaled by heat intensity for visual patterns
    - Lossless: Direct opcode values for exact roundtrip encoding/decoding
    """

    def __init__(self, lossless: bool = False):
        """
        Initialize the encoder.

        Args:
            lossless: If True, use exact opcode values for perfect roundtrip.
                     If False (default), use heat-scaled values for visual patterns.
        """
        self.lossless = lossless

    def encode_instruction(self, instruction: Instruction) -> np.ndarray:
        """
        Encode a single GeoASM instruction to an RGBA pixel.

        Args:
            instruction: The GeoASM instruction to encode

        Returns:
            numpy array of shape (4,) with dtype uint8: [R, G, B, A]
        """
        if self.lossless:
            # Lossless mode: direct opcode value
            red = instruction.opcode.value
            # Lossless mode: direct register values (rs and rd fit in 3 bits each)
            green = instruction.rs & 0x07
            blue = instruction.rd & 0x07
        else:
            # Semantic mode: scale opcode by heat intensity
            # Map opcode base (0xD0-0xD6) to 0-255 range with heat scaling
            heat = HEAT_INTENSITY.get(instruction.opcode, 0.5)
            # Use the opcode value directly scaled by heat
            # This keeps the opcode identifiable while showing heat
            red = int(instruction.opcode.value * heat)
            red = min(255, max(0, red))  # Clamp to valid range

            # Green = Source register (R0-R7 mapped to 0-255)
            green = int(instruction.rs * 255 / 7)
            green = min(255, max(0, green))

            # Blue = Destination register (R0-R7 mapped to 0-255)
            blue = int(instruction.rd * 255 / 7)
            blue = min(255, max(0, blue))

        # Alpha = Immediate value (direct 0-255)
        alpha = instruction.imm & 0xFF

        return np.array([red, green, blue, alpha], dtype=np.uint8)

    def decode_pixel(self, pixel: np.ndarray) -> Instruction:
        """
        Decode an RGBA pixel back to a GeoASM instruction.

        Note: Only works correctly in lossless mode where opcode values are preserved.
        In semantic mode, the decoded opcode may not match the original.

        Args:
            pixel: numpy array of shape (4,) with [R, G, B, A]

        Returns:
            Decoded Instruction
        """
        red = int(pixel[0])
        green = int(pixel[1])
        blue = int(pixel[2])
        alpha = int(pixel[3])

        # Decode opcode from red channel
        # In lossless mode, this is the exact opcode value
        # In semantic mode, we try to find the closest opcode
        opcode = self._decode_opcode(red)

        # Decode registers from green/blue channels
        if self.lossless:
            # Lossless mode: direct register values
            rs = green & 0x07
            rd = blue & 0x07
        else:
            # Semantic mode: scaled registers
            rs = int(green * 7 / 255)
            rd = int(blue * 7 / 255)

        # Immediate value is direct
        imm = alpha

        return Instruction(opcode=opcode, rs=rs, rd=rd, imm=imm)

    def _decode_opcode(self, red_value: int) -> Opcode:
        """
        Decode opcode from red channel value.

        In lossless mode, red is the exact opcode value.
        In semantic mode, find the closest matching opcode.
        """
        if self.lossless:
            # Direct lookup
            return Opcode(red_value)
        else:
            # Semantic mode: find closest opcode by heat-scaled value
            # Calculate what red value each opcode would produce
            min_distance = 256
            closest_opcode = Opcode.EMBED

            for opcode, heat in HEAT_INTENSITY.items():
                expected_red = int(opcode.value * heat)
                distance = abs(expected_red - red_value)
                if distance < min_distance:
                    min_distance = distance
                    closest_opcode = opcode

            return closest_opcode

    def encode_program(self, instructions: List[Instruction]) -> np.ndarray:
        """
        Encode a list of GeoASM instructions to a pixel array.

        Args:
            instructions: List of GeoASM instructions

        Returns:
            numpy array of shape (N, 4) where N is number of instructions
        """
        if not instructions:
            return np.array([], dtype=np.uint8).reshape(0, 4)

        pixels = [self.encode_instruction(instr) for instr in instructions]
        return np.array(pixels, dtype=np.uint8)

    def decode_program(self, pixels: np.ndarray) -> List[Instruction]:
        """
        Decode a pixel array back to a list of GeoASM instructions.

        Args:
            pixels: numpy array of shape (N, 4)

        Returns:
            List of decoded Instructions
        """
        if pixels.size == 0:
            return []

        instructions = []
        for pixel in pixels:
            instructions.append(self.decode_pixel(pixel))

        return instructions

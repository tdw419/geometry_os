"""
Geometry OS Types Module
Data types for glyphs, textures, and VM state.
"""

from dataclasses import dataclass
from enum import IntEnum
from typing import Optional
import numpy as np


class Opcode(IntEnum):
    """Glyph instruction opcodes."""
    NOP = 0x00
    MOV = 0x01
    LDI = 0x08
    LOAD = 0x03
    STORE = 0x04
    ADD = 0x33
    SUB = 0x34
    MUL = 0x35
    DIV = 0x36
    JMP = 0x06
    HALT = 0x07
    DATA = 0x09
    LDI_U8 = 0x0a
    LDI_I32 = 0x0a
    LDI_ADDR = 0x0b
    SPATIAL_SPAWN = 0x0c


class Stratum(IntEnum):
    """Spatial strata for glyph operations."""
    SUBSTRATE = 0
    MEMORY = 1
    LOGIC = 2
    SPEC = 3
    INTENT = 4


class VMState(IntEnum):
    """VM execution states."""
    HALT = 0
    RUNNING = 1
    JUMP = 2
    LOAD = 3
    STORE = 4
    ADD = 5
    SUB = 6
    MUL = 7
    DIV = 8


@dataclass
class GlyphInstruction:
    """A single glyph instruction with all properties."""
    opcode: Opcode
    stratum: Stratum
    p1: int = 0
    p2: int = 0
    vm_state: VMState = VMState.HALT

    @property
    def is_halt(self) -> bool:
        return self.vm_state == VMState.HALT

    @property
    def is_jump(self) -> bool:
        return self.vm_state == VMState.JUMP

    @property
    def is_load(self) -> bool:
        return self.vm_state == VMState.LOAD

    @property
    def is_store(self) -> bool:
        return self.vm_state == VMState.STORE

    @property
    def is_alu(self) -> bool:
        return self.vm_state in (VMState.ADD, VMState.SUB, VMState.MUL, VMState.DIV)

    def to_rgba(self) -> tuple[int, int, int, int]:
        """Convert to RGBA pixel values."""
        return (int(self.opcode), int(self.stratum), self.p1, self.p2)

    @classmethod
    def from_rgba(cls, r: int, g: int, b: int, a: int) -> "GlyphInstruction":
        """Create instruction from RGBA pixel values."""
        return cls(
            opcode=Opcode(r),
            stratum=Stratum(g),
            p1=b,
            p2=a,
        )


@dataclass
class Texture:
    """A spatial texture containing glyph instructions."""
    data: np.ndarray  # Shape: (H, W, 4) for RGBA
    grid_size: int

    @property
    def instruction_count(self) -> int:
        """Count non-NOP instructions."""
        return np.sum(self.data[:, :, 0] != 0)

    @property
    def density(self) -> float:
        """Instruction density ratio."""
        return self.instruction_count / (self.grid_size * self.grid_size)

    def get_instruction(self, x: int, y: int) -> Optional[GlyphInstruction]:
        """Get instruction at coordinates."""
        r, g, b, a = self.data[y, x]
        if r == 0:  # NOP
            return None
        return GlyphInstruction.from_rgba(r, g, b, a)

    def set_instruction(self, x: int, y: int, inst: GlyphInstruction) -> None:
        """Set instruction at coordinates."""
        self.data[y, x] = inst.to_rgba()

    def save(self, path: str) -> None:
        """Save texture as PNG."""
        from PIL import Image
        Image.fromarray(self.data, 'RGBA').save(path)

    @classmethod
    def load(cls, path: str) -> "Texture":
        """Load texture from PNG file."""
        from PIL import Image
        img = Image.open(path)
        data = np.array(img)
        return cls(data=data, grid_size=img.size[0])

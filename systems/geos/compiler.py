"""
Geometry OS Compiler Module
RISC-V to Glyph transpiler and texture generation.
"""

import numpy as np
from PIL import Image
from pathlib import Path
from typing import Optional, Dict, Any, List
from dataclasses import dataclass, field
import time

from .core import hilbert_d2xy, hilbert_xy2d, HilbertCurve
from .types import Opcode, Texture, GlyphInstruction
from .benchmarks import benchmark_sls


@dataclass
class RISCVToGeometricJIT:
    """Transpiles RISC-V ELF to glyph textures."""
    input_path: str
    output_path: str
    warp_size: int = 32
    zone_order: List[int] = field(default_factory=lambda: [0, 1, 2, 3])
    data: Optional[bytes] = None
    grid_size: int = 0
    order: int = 0
    hilbert: Optional[HilbertCurve] = None

    def load_binary(self) -> None:
        """Load the RISC-V binary file."""
        with open(self.input_path, 'rb') as f:
            self.data = f.read()
        num_instructions = (len(self.data) + 3) // 4
        self.order = int(np.ceil(np.log2(np.sqrt(num_instructions))))
        self.grid_size = 2 ** self.order
        self.hilbert = HilbertCurve(self.order)

    def decode_and_map(self) -> np.ndarray:
        """Decode RISC-V instructions and map to spatial layout."""
        pixels = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)

        # Address Map: Logical Index -> Physical Hilbert Index
        logical_to_physical: Dict[int, int] = {}
        silos = [[] for _ in range(4)]

        # Pass 1: Address Mapping & Siloing
        for i in range(0, len(self.data), 4):
            chunk = self.data[i:i+4].ljust(4, b'\x00')
            inst_val = int.from_bytes(chunk, 'little')
            opcode_riscv = inst_val & 0x7F

            # Determine Zone
            zone_idx = 3
            if opcode_riscv == 0x33 or opcode_riscv == 0x13:
                zone_idx = 0  # ALU/IMM
            elif opcode_riscv in [0x03, 0x23]:
                zone_idx = 1  # MEM
            elif opcode_riscv in [0x6F, 0x67, 0x63]:
                zone_idx = 2  # CTRL

            logical_idx = i // 4
            silos[zone_idx].append(logical_idx)

        # Calculate Physical Offsets
        BLOCK_SIZE = 4096
        WARP_SIZE = self.warp_size
        current_phys = 0
        silo_ptrs = [0] * len(silos)

        while any(silo_ptrs[j] < len(silos[j]) for j in range(len(silos))):
            for zone_idx in self.zone_order:
                for _ in range(BLOCK_SIZE // WARP_SIZE):
                    for __ in range(WARP_SIZE):
                        if silo_ptrs[zone_idx] < len(silos[zone_idx]):
                            logical_idx = silos[zone_idx][silo_ptrs[zone_idx]]
                            logical_to_physical[logical_idx] = current_phys
                            current_phys += 1
                            silo_ptrs[zone_idx] += 1

                    if current_phys % WARP_SIZE != 0:
                        current_phys += (WARP_SIZE - (current_phys % WARP_SIZE))

        # Pass 2: Semantic Translation
        for i in range(0, len(self.data), 4):
            chunk = self.data[i:i+4].ljust(4, b'\x00')
            inst_val = int.from_bytes(chunk, 'little')
            opcode_riscv = inst_val & 0x7F

            rd = (inst_val >> 7) & 0x1F
            rs1 = (inst_val >> 15) & 0x1F
            rs2 = (inst_val >> 20) & 0x1F

            op_geo = Opcode.NOP
            r1, r2, out_rd = rs1, rs2, rd

            if opcode_riscv == 0x6F:  # JAL
                op_geo = Opcode.JMP
            elif opcode_riscv == 0x33:  # ALU
                op_geo = Opcode.ADD
            elif opcode_riscv == 0x13:  # IMM
                op_geo = Opcode.LDI
                r1 = (inst_val >> 20) & 0xFF
            elif opcode_riscv == 0x03:
                op_geo = Opcode.LOAD
            elif opcode_riscv == 0x23:
                op_geo = Opcode.STORE

            logical_idx = i // 4
            if logical_idx in logical_to_physical:
                phys_idx = logical_to_physical[logical_idx]
                x, y = self.hilbert.d_to_xy(phys_idx)
                pixels[y, x] = [int(op_geo), r1, r2, out_rd]

        return pixels

    def run(self) -> None:
        """Execute the transpilation."""
        self.load_binary()
        print(f"Crystallizing {len(self.data)} bytes...")
        pixels = self.decode_and_map()
        Image.fromarray(pixels, 'RGBA').save(self.output_path)
        print(f"✅ Executable Spatial Linux: {self.output_path}")


def crystallize(glyph_file: str, output_path: str, **kwargs) -> Dict[str, Any]:
    """
    Compile a .glyph file to .rts.png texture.

    Args:
        glyph_file: Path to .glyph source
        output_path: Path to output texture
        **kwargs: Additional options

    Returns:
        Result dict with status and metrics
    """
    start_time = time.time()

    # Load glyph file
    glyph_path = Path(glyph_file)
    if not glyph_path.exists():
        return {"status": "error", "error": f"Glyph file not found: {glyph_file}"}

    # Read source
    source = glyph_path.read_text()

    # Parse instructions (simplified)
    instructions = []
    for line in source.split('\n'):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        parts = line.split()
        if parts:
            op_str = parts[0].upper()
            try:
                op = Opcode[op_str]
                p1 = int(parts[1]) if len(parts) > 1 else 0
                p2 = int(parts[2]) if len(parts) > 2 else 0
                instructions.append((op, 0, p1, p2))
            except (ValueError, KeyError):
                continue

    # Calculate grid size
    num_inst = len(instructions)
    grid_size = 2 ** int(np.ceil(np.log2(np.sqrt(max(num_inst, 1)))))

    # Create texture
    pixels = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    hilbert = HilbertCurve(int(np.log2(grid_size)))

    for i in range(len(instructions)):
        x, y = hilbert.d_to_xy(i)
        op, st, p1, p2 = instructions[i]
        pixels[y, x] = [int(op), st, p1, p2]

    # Save
    Image.fromarray(pixels, 'RGBA').save(output_path)

    elapsed = time.time() - start_time
    output_size = Path(output_path).stat().st_size if Path(output_path).exists() else 0

    return {
        "status": "success",
        "input": glyph_file,
        "output": output_path,
        "output_size": output_size,
        "instruction_count": len(instructions),
        "grid_size": grid_size,
        "elapsed_ms": elapsed * 1000,
    }


def linux_to_glyph(binary_path: str, output_path: str, **kwargs) -> Dict[str, Any]:
    """
    Transpile a Linux ELF binary to glyph texture.

    Args:
        binary_path: Path to RISC-V ELF binary
        output_path: Path to output texture
        **kwargs: Additional options (warp_size, zone_order)

    Returns:
        Result dict with status and metrics
    """
    start_time = time.time()

    binary = Path(binary_path)
    if not binary.exists():
        return {"status": "error", "error": f"Binary not found: {binary_path}"}

    # Check ELF magic
    with open(binary, 'rb') as f:
        magic = f.read(4)
        if magic != b'\x7fELF':
            return {"status": "error", "error": "Not an ELF file"}

    # Run transpiler
    warp_size = kwargs.get('warp_size', 32)
    zone_order = kwargs.get('zone_order', [0, 1, 2, 3])

    jit = RISCVToGeometricJIT(
        str(binary),
        str(output_path),
        warp_size=warp_size,
        zone_order=zone_order,
    )
    jit.run()

    elapsed = time.time() - start_time
    output_size = Path(output_path).stat().st_size if Path(output_path).exists() else 0

    return {
        "status": "success",
        "input": str(binary),
        "output": str(output_path),
        "output_size": output_size,
        "elapsed_ms": elapsed * 1000,
    }

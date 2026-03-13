#!/usr/bin/env python3
"""
Geometry OS - Brain-Driven Glyph Compiler
Phase 61: Recursive Compiling - The Brain compiles a mini-OS

The Brain proposes programs, they compile to glyph textures,
the GPU executes them, and results feed back to evolve the Brain.
"""

import wgpu
import numpy as np
import time
import json
import hashlib
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import List, Dict, Any, Optional, Tuple
from PIL import Image

# Import the Sisyphus Brain
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))
from systems.sisyphus.sisyphus_brain import SisyphusBrain

# Opcode constants (matching glyph_microcode.wgsl)
OP_ADD = 200
OP_SUB = 201
OP_MUL = 202
OP_DIV = 203
OP_LOAD = 204
OP_STORE = 205
OP_LOADI = 206
OP_ZERO = 207
OP_JMP = 208
OP_BNZ = 209
OP_CALL = 210
OP_RET = 211
OP_HALT = 255
OP_DRAW = 215
OP_READ_INPUT = 216
OP_DATA = 9
OP_BRANCH = 6

SHADER_PATH = Path(__file__).parent.parent / "visual_shell/web/shaders/glyph_brain.wgsl"


@dataclass
class GlyphProgram:
    """A program in glyph-atomic form."""
    name: str
    instructions: List[Tuple[int, int, int, int]]  # (opcode, stratum, data1, data2)
    description: str = ""

    def to_texture(self, size: int = 64) -> np.ndarray:
        """Convert to RGBA texture for GPU execution."""
        pixels = np.zeros((size, size, 4), dtype=np.uint8)
        for i, (op, strat, d1, d2) in enumerate(self.instructions):
            if i < size * size:
                y, x = divmod(i, size)
                pixels[y, x] = [op, strat, d1, d2]
        return pixels

    def to_rts_png(self, path: Path) -> None:
        """Save as .rts.png executable brick."""
        size = max(64, int(np.ceil(np.sqrt(len(self.instructions)))))
        pixels = self.to_texture(size)
        Image.fromarray(pixels, 'RGBA').save(path)
        print(f"  Crystallized: {path}")


class BrainCompiler:
    """
    The Brain learns to write glyph programs.

    It proposes programs based on curiosity, executes them on GPU,
    and evolves based on results.
    """

    def __init__(self, brain: Optional[SisyphusBrain] = None):
        self.brain = brain or SisyphusBrain()
        self.generation = 0
        self.programs: Dict[str, GlyphProgram] = {}
        self.results: List[Dict[str, Any]] = []

        # Initialize GPU
        self._init_gpu()

        # Known working programs (seeds)
        self._seed_programs()

    def _init_gpu(self):
        """Initialize WebGPU context."""
        self.adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
        self.device = self.adapter.request_device()

        with open(SHADER_PATH, "r") as f:
            self.shader_code = f.read()

        self.shader_module = self.device.create_shader_module(code=self.shader_code)

    def _seed_programs(self):
        """Seed the Brain with known working programs."""
        # Factorial (computes 5! = 120)
        # Encoding: (opcode, stratum, data1, data2) where r[data1] = r[data1] op r[data2] for binary ops
        # For OP_DATA: r[data1] = data2
        self.programs["factorial"] = GlyphProgram(
            name="factorial",
            instructions=[
                (OP_DATA, 0, 1, 5),     # r1 = 5 (counter)
                (OP_DATA, 0, 2, 1),     # r2 = 1 (accumulator)
                (OP_DATA, 0, 3, 1),     # r3 = 1 (constant for decrement)
                (OP_MUL, 2, 2, 1),      # r2 = r2 * r1  (r[2] = r[2] * r[1])
                (OP_SUB, 2, 1, 3),      # r1 = r1 - r3  (r[1] = r[1] - r[3] = r[1] - 1)
                (OP_BNZ, 2, 1, 3),      # if r1 != 0: goto 3 (the MUL instruction)
                (OP_HALT, 0, 0, 0),     # halt
            ],
            description="Computes factorial of 5"
        )

        # Counter (sum 1+2+...+10 = 55)
        self.programs["counter"] = GlyphProgram(
            name="counter",
            instructions=[
                (OP_DATA, 0, 0, 0),     # r0 = 0 (accumulator)
                (OP_DATA, 0, 1, 10),    # r1 = 10 (counter)
                (OP_DATA, 0, 2, 1),     # r2 = 1 (constant for decrement)
                (OP_ADD, 2, 0, 1),      # r0 = r0 + r1
                (OP_SUB, 2, 1, 2),      # r1 = r1 - r2 (decrement)
                (OP_BNZ, 2, 1, 3),      # if r1 != 0: goto 3 (the ADD instruction)
                (OP_HALT, 0, 0, 0),     # halt
            ],
            description="Counts sum 1+2+...+10"
        )

        # Visual Swarm (draws agents)
        self.programs["swarm_draw"] = GlyphProgram(
            name="swarm_draw",
            instructions=[
                (OP_DRAW, 0, 0, 0),     # Draw agent at (dna.z, dna.w) with color dna.x
                (OP_HALT, 0, 0, 0),     # halt
            ],
            description="Visual swarm renderer"
        )

        print(f"[BrainCompiler] Seeded {len(self.programs)} programs")

    def execute(self, program: GlyphProgram, iterations: int = 1) -> Dict[str, Any]:
        """Execute a glyph program on the GPU."""
        texture_data = program.to_texture(64)
        side = 64

        # Create program texture
        glyph_texture = self.device.create_texture(
            size=(side, side, 1),
            usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
            format=wgpu.TextureFormat.rgba8unorm,
        )
        self.device.queue.write_texture(
            {"texture": glyph_texture, "origin": (0, 0, 0), "mip_level": 0},
            texture_data,
            {"bytes_per_row": side * 4, "rows_per_image": side},
            (side, side, 1),
        )

        # Create buffers
        state_buffer = self.device.create_buffer(
            size=36 * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )
        memory_buffer = self.device.create_buffer(
            size=16384 * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

        # Output texture for visual output
        output_texture = self.device.create_texture(
            size=(64, 64, 1),
            usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
            format=wgpu.TextureFormat.rgba8unorm,
        )

        # Create pipeline
        compute_pipeline = self.device.create_compute_pipeline(
            layout="auto",
            compute={"module": self.shader_module, "entry_point": "main"},
        )

        # Bindings (4 bindings matching glyph_brain.wgsl)
        bind_group = self.device.create_bind_group(
            layout=compute_pipeline.get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": glyph_texture.create_view()},
                {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
                {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
                {"binding": 3, "resource": output_texture.create_view()},
            ],
        )

        # Execute
        start = time.perf_counter()
        for _ in range(iterations):
            encoder = self.device.create_command_encoder()
            pass_enc = encoder.begin_compute_pass()
            pass_enc.set_pipeline(compute_pipeline)
            pass_enc.set_bind_group(0, bind_group)
            pass_enc.dispatch_workgroups(1)
            pass_enc.end()
            self.device.queue.submit([encoder.finish()])

        self.device.queue.on_submitted_work_done()
        elapsed = time.perf_counter() - start

        # Read results
        state_out = np.frombuffer(self.device.queue.read_buffer(state_buffer), dtype=np.uint32)
        memory_out = np.frombuffer(self.device.queue.read_buffer(memory_buffer), dtype=np.uint32)

        return {
            "program": program.name,
            "elapsed_ms": elapsed * 1000,
            "registers": state_out[:8].tolist(),
            "memory_sample": memory_out[:16].tolist(),
            "gips": len(program.instructions) * iterations / elapsed if elapsed > 0 else 0,
        }

    def propose_program(self) -> GlyphProgram:
        """
        Brain proposes a new program based on curiosity.

        This uses mutation and combination of existing programs.
        """
        import random

        # Get mutation proposal from brain
        mutation = self.brain.propose_mutation()

        if mutation and random.random() < 0.3:
            # Brain-directed mutation
            base_name = random.choice(list(self.programs.keys()))
            base = self.programs[base_name]

            # Mutate: change one instruction
            if base.instructions:
                idx = random.randint(0, len(base.instructions) - 1)
                op, strat, d1, d2 = base.instructions[idx]

                # Mutate one field
                choice = random.randint(0, 3)
                if choice == 0:
                    op = random.choice([OP_ADD, OP_SUB, OP_MUL, OP_DATA, OP_BNZ, OP_HALT])
                elif choice == 1:
                    d1 = random.randint(0, 31)
                else:
                    d2 = random.randint(0, 31)

                new_insts = list(base.instructions)
                new_insts[idx] = (op, strat, d1, d2)

                return GlyphProgram(
                    name=f"mutant_{self.generation}",
                    instructions=new_insts,
                    description=f"Mutated from {base_name}"
                )

        # Generate a random exploratory program
        ops = [OP_ADD, OP_SUB, OP_MUL, OP_DATA, OP_BNZ, OP_HALT]
        length = random.randint(3, 10)
        instructions = []

        for i in range(length):
            op = random.choice(ops)
            strat = random.randint(0, 3)
            d1 = random.randint(0, 31)
            d2 = random.randint(0, 31) if op != OP_HALT else 0
            instructions.append((op, strat, d1, d2))

        # Ensure it halts
        if instructions[-1][0] != OP_HALT:
            instructions.append((OP_HALT, 0, 0, 0))

        return GlyphProgram(
            name=f"explore_{self.generation}",
            instructions=instructions,
            description="Random exploration"
        )

    def evaluate_fitness(self, result: Dict[str, Any]) -> float:
        """
        Evaluate fitness of a program result.

        Fitness is based on:
        - Program halts (doesn't hang)
        - Produces non-trivial output
        - Executes efficiently (high GIPS)
        """
        fitness = 0.0

        # Did it produce output?
        registers = result.get("registers", [0] * 8)
        if any(r != 0 for r in registers):
            fitness += 0.3

        # Did it halt (last register changed)?
        if registers[0] != 0:
            fitness += 0.2

        # Performance bonus
        gips = result.get("gips", 0)
        if gips > 1000:
            fitness += 0.3
        if gips > 10000:
            fitness += 0.2

        return min(1.0, fitness)

    def evolve(self, generations: int = 10):
        """
        Run the evolution loop.

        Each generation:
        1. Brain proposes a program
        2. Execute on GPU
        3. Evaluate fitness
        4. Update Brain
        """
        print(f"\n{'='*60}")
        print(f"Brain-Driven Evolution - {generations} generations")
        print(f"{'='*60}\n")

        best_fitness = 0.0

        for gen in range(generations):
            self.generation = gen

            # Brain proposes
            program = self.propose_program()
            print(f"[Gen {gen}] Brain proposes: {program.name}")
            print(f"  Instructions: {len(program.instructions)}")

            # Execute
            try:
                result = self.execute(program, iterations=10)
                fitness = self.evaluate_fitness(result)

                # Update brain
                self.brain.update_fitness(fitness)
                self.brain.observe({
                    "type": "program_execution",
                    "program": program.name,
                    "fitness": fitness,
                    "gips": result["gips"],
                })

                # Keep good programs
                if fitness > 0.5:
                    self.programs[program.name] = program
                    print(f"  ✓ KEPT (fitness={fitness:.2f})")

                    # Save as executable brick
                    brick_path = Path(f"systems/glyph_stratum/bricks/{program.name}.rts.png")
                    brick_path.parent.mkdir(parents=True, exist_ok=True)
                    program.to_rts_png(brick_path)
                else:
                    print(f"  ✗ DISCARDED (fitness={fitness:.2f})")

                # Record result
                self.results.append({
                    "generation": gen,
                    "program": program.name,
                    "fitness": fitness,
                    **result
                })

                if fitness > best_fitness:
                    best_fitness = fitness

            except Exception as e:
                print(f"  ✗ ERROR: {e}")
                self.brain.observe({
                    "type": "execution_error",
                    "program": program.name,
                    "error": str(e)
                })

        # Summary
        print(f"\n{'='*60}")
        print(f"Evolution Complete")
        print(f"{'='*60}")
        print(f"  Generations: {generations}")
        print(f"  Best Fitness: {best_fitness:.2f}")
        print(f"  Programs Kept: {len(self.programs)}")
        print(f"  Brain Mutations: {self.brain.state.mutations_applied}")

        return self.programs

    def compile_mini_os(self) -> Path:
        """
        Compile the best programs into a mini-OS brick.

        This creates a .rts.png that contains multiple programs
        laid out spatially.
        """
        print("\n[BrainCompiler] Assembling Mini-OS from evolved programs...")

        # Layout programs in a 4x4 grid
        os_size = 256
        os_pixels = np.zeros((os_size, os_size, 4), dtype=np.uint8)

        programs_list = list(self.programs.items())
        grid_size = int(np.ceil(np.sqrt(len(programs_list))))

        for idx, (name, program) in enumerate(programs_list[:16]):  # Max 16 programs
            grid_x = idx % grid_size
            grid_y = idx // grid_size

            # Each program gets a 64x64 cell
            cell_size = 64
            offset_x = grid_x * cell_size
            offset_y = grid_y * cell_size

            program_texture = program.to_texture(cell_size)
            os_pixels[offset_y:offset_y+cell_size, offset_x:offset_x+cell_size] = program_texture

            print(f"  [{grid_y},{grid_x}] {name}")

        # Save the mini-OS
        os_path = Path("systems/glyph_stratum/bricks/mini_os.rts.png")
        os_path.parent.mkdir(parents=True, exist_ok=True)
        Image.fromarray(os_pixels, 'RGBA').save(os_path)

        print(f"\n✅ Mini-OS compiled: {os_path}")
        print(f"   Size: {os_size}x{os_size}")
        print(f"   Programs: {len(programs_list[:16])}")

        return os_path


def main():
    """Run the Brain-Driven Compiler."""
    import argparse

    parser = argparse.ArgumentParser(description="Brain-Driven Glyph Compiler")
    parser.add_argument("--generations", type=int, default=20, help="Evolution generations")
    parser.add_argument("--compile-os", action="store_true", help="Compile mini-OS after evolution")
    args = parser.parse_args()

    print("="*60)
    print("Geometry OS - Brain-Driven Glyph Compiler")
    print("Phase 61: Recursive Compiling")
    print("="*60)

    compiler = BrainCompiler()

    # Run evolution
    programs = compiler.evolve(generations=args.generations)

    # Optionally compile mini-OS
    if args.compile_os or True:
        os_path = compiler.compile_mini_os()

    # Save brain state
    brain_path = Path("systems/glyph_stratum/brain_state.json")
    brain_path.parent.mkdir(parents=True, exist_ok=True)
    compiler.brain.save_state(brain_path)

    print(f"\n✅ Brain state saved: {brain_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())

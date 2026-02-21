"""
Infinite Evolution Substrate - Parallel Geometric Intelligence on Infinite Map

Deploys the PixelRTS v3 evolution daemon across the entire Infinite Map,
creating a massive-scale parallel evolution substrate where each tile
hosts its own evolving population of geometric programs.

Architecture:
- Each tile (VAT entry) = isolated evolution chamber
- Gravity placer moves high-fitness programs toward map center
- Cross-tile migration via Hilbert-adjacent regions
- HUD visualization via Visual Bridge telemetry

Usage:
    python3 infinite_evolution_substrate.py --tiles 64 --generations 1000
"""

import sys
import os
import json
import time
import random
import math
from datetime import datetime
from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass, field
from multiprocessing import Pool, cpu_count
import hashlib

# Add paths for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

# Try to import WordPress publisher for semantic memory
try:
    from wordpress_zone.geometric_publisher import GeometricPublisher
    WP_AVAILABLE = True
except ImportError:
    WP_AVAILABLE = False


# Extended PixelRTS v3 Instruction Set
OPCODES = {
    "NOP": 0x00, "MOV": 0x01, "ADD": 0x33, "SUB": 0x34, "MUL": 0x35, "DIV": 0x36,
    "JMP": 0x06, "HALT": 0x07, "LDI": 0x08,
    "CMP": 0x37,  # Compare: CMP r1, r2 -> sets flag
    "BEQ": 0x38,  # Branch if Equal: BEQ r1, r2, offset
    "LDP": 0x47,  # Load Pixel: LDP rd, addr -> reads RGBA at Hilbert index
    "STP": 0x48,  # Store Pixel: STP rs, addr -> writes RGBA at Hilbert index
}

OPCODE_VALUES = {v: k for k, v in OPCODES.items()}


@dataclass
class GeometricProgram:
    """A geometric program with RGBA instructions."""
    instructions: List[List[int]]  # [[R, G, B, A], ...]
    grid_size: int = 4
    fitness: float = 0.0
    generation: int = 0
    tile_id: int = 0
    lineage: List[str] = field(default_factory=list)

    def to_rgba_grid(self) -> List[List[Tuple[int, int, int, int]]]:
        """Convert to 2D grid via Hilbert mapping."""
        from systems.pixel_compiler.pixelrts_v3.pasm import HilbertCurve
        hilbert = HilbertCurve(self.grid_size)
        grid = [[(0, 0, 0, 0) for _ in range(self.grid_size)] for _ in range(self.grid_size)]

        for i, instr in enumerate(self.instructions):
            if i >= self.grid_size * self.grid_size:
                break
            x, y = hilbert.d2xy(i)
            grid[y][x] = tuple(instr)

        return grid

    def hash(self) -> str:
        """Generate unique hash for this program."""
        data = ''.join(str(i) for instr in self.instructions for i in instr)
        return hashlib.md5(data.encode()).hexdigest()[:8]


class GeometricVM:
    """
    Extended Geometric VM with self-modification support.
    Executes PixelRTS v3 programs with LDP/STP for DNA manipulation.
    """

    def __init__(self, grid_size: int = 4):
        self.grid_size = grid_size
        self.regs = [0] * 32
        self.pc = 0
        self.halted = False
        self.instructions: List[List[int]] = []
        self.flag_zero = False
        self.flag_negative = False
        self.steps_taken = 0
        self.max_steps = 1000

    def load_program(self, program: GeometricProgram):
        """Load a geometric program."""
        self.instructions = program.instructions.copy()
        self.grid_size = program.grid_size
        self.reset()

    def reset(self):
        """Reset VM state."""
        self.regs = [0] * 32
        self.pc = 0
        self.halted = False
        self.flag_zero = False
        self.flag_negative = False
        self.steps_taken = 0

    def step(self) -> bool:
        """Execute one instruction. Returns False if halted."""
        if self.halted or self.pc >= len(self.instructions):
            self.halted = True
            return False

        if self.steps_taken >= self.max_steps:
            self.halted = True
            return False

        self.steps_taken += 1
        instr = self.instructions[self.pc]
        r, g, b, a = instr

        def read_reg(idx):
            return self.regs[idx] if 0 <= idx < 32 else 0

        def write_reg(idx, val):
            if 0 < idx < 32:
                self.regs[idx] = val & 0xFFFFFFFF

        # Execute opcode
        if r == 0x00:  # NOP
            self.pc += 1

        elif r == 0x01:  # MOV rd, rs1
            write_reg(a, read_reg(g))
            self.pc += 1

        elif r == 0x08:  # LDI rd, imm
            write_reg(a, g)
            self.pc += 1

        elif r == 0x33:  # ADD rd, rs1, rs2
            write_reg(a, read_reg(g) + read_reg(b))
            self.pc += 1

        elif r == 0x34:  # SUB rd, rs1, rs2
            write_reg(a, read_reg(g) - read_reg(b))
            self.pc += 1

        elif r == 0x35:  # MUL rd, rs1, rs2
            write_reg(a, read_reg(g) * read_reg(b))
            self.pc += 1

        elif r == 0x36:  # DIV rd, rs1, rs2
            if read_reg(b) != 0:
                write_reg(a, read_reg(g) // read_reg(b))
            self.pc += 1

        elif r == 0x37:  # CMP rs1, rs2
            diff = read_reg(g) - read_reg(b)
            self.flag_zero = (diff == 0)
            self.flag_negative = (diff < 0)
            self.pc += 1

        elif r == 0x38:  # BEQ rs1, rs2, offset
            if read_reg(g) == read_reg(b):
                self.pc = self.pc + a
            else:
                self.pc += 1

        elif r == 0x06:  # JMP addr
            self.pc = g if g < 32 else read_reg(g)

        elif r == 0x47:  # LDP rd, addr_reg
            # Load pixel from Hilbert index stored in register g
            idx = read_reg(g)
            if 0 <= idx < len(self.instructions):
                pixel = self.instructions[idx]
                # Pack RGBA into register
                write_reg(a, (pixel[0] << 24) | (pixel[1] << 16) | (pixel[2] << 8) | pixel[3])
            self.pc += 1

        elif r == 0x48:  # STP rs, addr_reg
            # Store register value as RGBA pixel at Hilbert index
            idx = read_reg(a)
            if 0 <= idx < len(self.instructions):
                val = read_reg(g)
                self.instructions[idx] = [
                    (val >> 24) & 0xFF,
                    (val >> 16) & 0xFF,
                    (val >> 8) & 0xFF,
                    val & 0xFF
                ]
            self.pc += 1

        elif r == 0x07:  # HALT
            self.halted = True

        else:
            self.pc += 1  # Unknown opcode = NOP

        return True

    def run(self, max_steps: int = 1000) -> Dict[str, Any]:
        """Run until halt or max steps."""
        self.max_steps = max_steps
        while self.step():
            pass

        return {
            "halted": self.halted,
            "steps": self.steps_taken,
            "pc": self.pc,
            "registers": self.regs.copy(),
            "final_instructions": self.instructions.copy()
        }


class EvolutionChamber:
    """
    Isolated evolution chamber for a single tile on the Infinite Map.
    """

    def __init__(self, tile_id: int, grid_size: int = 4):
        self.tile_id = tile_id
        self.grid_size = grid_size
        self.population: List[GeometricProgram] = []
        self.generation = 0
        self.best_fitness = 0.0
        self.vm = GeometricVM(grid_size)

        # Fitness target (evolution goal)
        self.target_register = 1  # Target register to optimize
        self.target_value = 42    # Target value to achieve

    def spawn_random(self, count: int) -> List[GeometricProgram]:
        """Generate random programs."""
        programs = []
        max_instr = self.grid_size * self.grid_size

        for _ in range(count):
            instructions = []
            num_instr = random.randint(4, max_instr)

            for _ in range(num_instr):
                op = random.choice(list(OPCODES.values()))
                g = random.randint(0, 31)
                b = random.randint(0, 31)
                a = random.randint(0, 31)
                instructions.append([op, g, b, a])

            programs.append(GeometricProgram(
                instructions=instructions,
                grid_size=self.grid_size,
                generation=self.generation,
                tile_id=self.tile_id
            ))

        return programs

    def evaluate_fitness(self, program: GeometricProgram) -> float:
        """
        Evaluate program fitness based on:
        1. Does it halt? (required)
        2. Does it reach target value in target register?
        3. Efficiency (fewer steps = better)
        """
        self.vm.load_program(program)
        result = self.vm.run(max_steps=500)

        if not result["halted"]:
            return 0.0  # Must halt

        # Distance to target value
        target_reg = result["registers"][self.target_register]
        distance = abs(target_reg - self.target_value)

        # Fitness: inverse distance + halting bonus
        if distance == 0:
            fitness = 1.0 + (1.0 / max(result["steps"], 1)) * 0.5  # Perfect + efficiency bonus
        else:
            fitness = 1.0 / (1.0 + distance)

        return min(fitness, 2.0)  # Cap at 2.0

    def mutate(self, program: GeometricProgram) -> GeometricProgram:
        """Mutate a program's instructions."""
        new_instructions = []

        for instr in program.instructions:
            if random.random() < 0.1:  # 10% mutation rate
                # Mutate this instruction
                mutated = instr.copy()
                field = random.randint(0, 3)

                if field == 0:  # Opcode
                    mutated[0] = random.choice(list(OPCODES.values()))
                else:  # Register/immediate
                    mutated[field] = random.randint(0, 31)

                new_instructions.append(mutated)
            else:
                new_instructions.append(instr.copy())

        # Maybe add or remove instruction
        if random.random() < 0.05 and len(new_instructions) < self.grid_size ** 2:
            new_instructions.append([
                random.choice(list(OPCODES.values())),
                random.randint(0, 31),
                random.randint(0, 31),
                random.randint(0, 31)
            ])
        elif random.random() < 0.05 and len(new_instructions) > 2:
            new_instructions.pop(random.randint(0, len(new_instructions) - 1))

        return GeometricProgram(
            instructions=new_instructions,
            grid_size=self.grid_size,
            generation=self.generation,
            tile_id=self.tile_id,
            lineage=program.lineage + [program.hash()]
        )

    def crossover(self, p1: GeometricProgram, p2: GeometricProgram) -> GeometricProgram:
        """Crossover two programs."""
        split = random.randint(1, min(len(p1.instructions), len(p2.instructions)) - 1)
        new_instructions = p1.instructions[:split] + p2.instructions[split:]

        return GeometricProgram(
            instructions=new_instructions,
            grid_size=self.grid_size,
            generation=self.generation,
            tile_id=self.tile_id,
            lineage=[p1.hash(), p2.hash()]
        )

    def evolve_generation(self, population_size: int = 20) -> GeometricProgram:
        """Run one generation of evolution."""
        self.generation += 1

        # Spawn initial population if empty
        if not self.population:
            self.population = self.spawn_random(population_size)

        # Evaluate fitness
        for program in self.population:
            program.fitness = self.evaluate_fitness(program)

        # Sort by fitness
        self.population.sort(key=lambda p: p.fitness, reverse=True)

        # Track best
        if self.population and self.population[0].fitness > self.best_fitness:
            self.best_fitness = self.population[0].fitness

        # Elite selection (top 20%)
        elite_count = max(2, population_size // 5)
        new_population = self.population[:elite_count]

        # Fill rest with mutations and crossovers
        while len(new_population) < population_size:
            if random.random() < 0.7 and len(self.population) >= 2:
                # Crossover
                p1, p2 = random.sample(self.population[:elite_count * 2], 2)
                child = self.crossover(p1, p2)
                if random.random() < 0.3:
                    child = self.mutate(child)
                new_population.append(child)
            else:
                # Mutation
                parent = random.choice(self.population[:elite_count])
                new_population.append(self.mutate(parent))

        self.population = new_population[:population_size]

        return self.population[0]


class InfiniteEvolutionSubstrate:
    """
    Manages parallel evolution across multiple tiles on the Infinite Map.
    """

    def __init__(self, num_tiles: int = 16, grid_size: int = 4):
        self.num_tiles = num_tiles
        self.grid_size = grid_size
        self.chambers: Dict[int, EvolutionChamber] = {}
        self.generation = 0
        self.best_programs: List[Tuple[int, GeometricProgram]] = []  # (tile_id, program)

        # Gravity placer settings
        self.center = (0, 0)  # Map center (focal point)
        self.gravity_constant = 0.1

        # Initialize chambers
        for tile_id in range(num_tiles):
            self.chambers[tile_id] = EvolutionChamber(tile_id, grid_size)

        # WordPress publisher for semantic memory
        self.publisher = GeometricPublisher() if WP_AVAILABLE else None

    def _calculate_gravity_position(self, tile_id: int, fitness: float) -> Tuple[float, float]:
        """
        Calculate tile position using Foveated Knowledge Gravity.
        High-fitness programs migrate toward center.
        """
        # Initial spread based on tile_id
        angle = (tile_id / self.num_tiles) * 2 * math.pi
        base_distance = 0.5 + (tile_id % 4) * 0.1

        # Gravity pulls high-fitness toward center
        gravity_pull = self.gravity_constant * fitness
        distance = base_distance * (1 - gravity_pull)

        x = distance * math.cos(angle)
        y = distance * math.sin(angle)

        return (x, y)

    def evolve_all_tiles(self, generations: int = 1) -> Dict[str, Any]:
        """Run evolution on all tiles for N generations."""
        results = {
            "generation": self.generation,
            "tiles": {},
            "best_overall": None,
            "breakthroughs": []
        }

        for gen in range(generations):
            self.generation += 1

            for tile_id, chamber in self.chambers.items():
                best = chamber.evolve_generation(population_size=15)

                tile_result = {
                    "best_fitness": best.fitness,
                    "best_instructions": len(best.instructions),
                    "chamber_gen": chamber.generation,
                    "position": self._calculate_gravity_position(tile_id, best.fitness)
                }

                results["tiles"][tile_id] = tile_result

                # Track best overall
                if results["best_overall"] is None or best.fitness > results["best_overall"][1].fitness:
                    results["best_overall"] = (tile_id, best)

                # Check for breakthrough (fitness > 0.95)
                if best.fitness > 0.95:
                    results["breakthroughs"].append({
                        "tile_id": tile_id,
                        "fitness": best.fitness,
                        "program_hash": best.hash(),
                        "generation": self.generation
                    })

        # Publish breakthroughs to WordPress
        if self.publisher and results["breakthroughs"]:
            for bt in results["breakthroughs"]:
                self.publisher.log_breakthrough(
                    title=f"Evolution Breakthrough on Tile {bt['tile_id']}",
                    description=f"Fitness {bt['fitness']:.3f} achieved at generation {bt['generation']}",
                    metrics=bt
                )

        return results

    def get_visualization_data(self) -> Dict[str, Any]:
        """Generate data for HUD visualization."""
        tiles = []

        for tile_id, chamber in self.chambers.items():
            if chamber.population:
                best = chamber.population[0]
                pos = self._calculate_gravity_position(tile_id, best.fitness)

                tiles.append({
                    "id": tile_id,
                    "x": pos[0],
                    "y": pos[1],
                    "fitness": best.fitness,
                    "generation": chamber.generation,
                    "program_hash": best.hash(),
                    "instruction_count": len(best.instructions)
                })

        return {
            "type": "evolution_substrate",
            "generation": self.generation,
            "num_tiles": self.num_tiles,
            "tiles": tiles
        }

    def migrate_elite(self, from_tile: int, to_tile: int):
        """Migrate elite program between tiles (spatial crossover)."""
        if from_tile in self.chambers and to_tile in self.chambers:
            source = self.chambers[from_tile]
            dest = self.chambers[to_tile]

            if source.population:
                elite = source.population[0]
                # Clone and reset generation for new tile
                migrant = GeometricProgram(
                    instructions=elite.instructions.copy(),
                    grid_size=elite.grid_size,
                    generation=dest.generation,
                    tile_id=to_tile,
                    lineage=elite.lineage + [f"migrate:{from_tile}"]
                )
                dest.population.append(migrant)


def run_evolution_demo(num_tiles: int = 8, generations: int = 50):
    """Demo: Run parallel evolution substrate."""
    print(f"🌱 Initializing Infinite Evolution Substrate")
    print(f"   Tiles: {num_tiles} | Generations: {generations}")
    print("=" * 50)

    substrate = InfiniteEvolutionSubstrate(num_tiles=num_tiles)

    for gen in range(generations):
        results = substrate.evolve_all_tiles(generations=1)

        if gen % 10 == 0 or results["breakthroughs"]:
            best_tile, best_prog = results["best_overall"] or (0, None)

            print(f"\n📊 Generation {substrate.generation}")
            fitness_val = best_prog.fitness if best_prog else 0.0
            print(f"   Best Fitness: {fitness_val:.4f} (Tile {best_tile})")
            print(f"   Breakthroughs: {len(results['breakthroughs'])}")

            if results["breakthroughs"]:
                for bt in results["breakthroughs"]:
                    print(f"   🚀 Tile {bt['tile_id']}: {bt['fitness']:.3f}")

    print("\n" + "=" * 50)
    print("🎬 Final Results:")

    viz_data = substrate.get_visualization_data()
    for tile in sorted(viz_data["tiles"], key=lambda t: -t["fitness"])[:5]:
        print(f"   Tile {tile['id']}: fitness={tile['fitness']:.4f}, gen={tile['generation']}")

    return substrate


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Evolution Substrate")
    parser.add_argument("--tiles", type=int, default=8, help="Number of evolution tiles")
    parser.add_argument("--generations", type=int, default=50, help="Number of generations")
    args = parser.parse_args()

    run_evolution_demo(args.tiles, args.generations)

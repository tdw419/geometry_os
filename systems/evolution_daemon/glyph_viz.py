"""
Glyph Evolution Visualizer - ASCII rendering for AI-evolved glyph programs.

Outputs .ascii files for the visual shell showing:
- Evolution progress (generations, fitness)
- Evolved program structure (opcodes, parameters)
- Fitness history sparkline
- Compiled SPIR-V binary stats

Part of ASCII Scene Graph for zero-cost AI perception.
"""

import json
import os
import random
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Any, Optional

from .glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_fast,
    compile_glyph_program,
    get_cache_stats,
)


# Opcode names for readable output
OPCODE_NAMES = {
    200: "ADD_M", 201: "SUB_M", 202: "MUL_M", 203: "DIV_M",
    204: "LD", 205: "ST", 206: "MOV", 207: "CLR",
    208: "JMP", 209: "JZ", 210: "CALL", 211: "RET",
    212: "HALT", 215: "DRAW",
    216: "ADD_MEM", 217: "SUB_MEM", 218: "INT_DISPATCH",
    220: "BRANCH_PROB", 221: "CONFIDENCE", 222: "ALTERNATE", 223: "ATTENTION",
    224: "MUTATE", 225: "SPAWN", 227: "EMBEDDING",
}


@dataclass
class EvolutionRun:
    """Records of a single evolution run."""
    seed_program: GlyphProgram
    best_program: Optional[GlyphProgram] = None
    generations: int = 0
    best_fitness: float = 0.0
    fitness_history: List[float] = field(default_factory=list)
    start_time: Optional[datetime] = None
    end_time: Optional[datetime] = None

    def __post_init__(self):
        if self.start_time is None:
            self.start_time = datetime.utcnow()


class GlyphEvolutionVisualizer:
    """
    ASCII renderer for glyph evolution experiments.

    Emits .ascii files for visual shell consumption:
    - glyph_evolution.ascii: Main evolution status
    - glyph_program.ascii: Current best program
    """

    def __init__(self, output_dir: str = ".geometry/ascii_scene"):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.current_run: Optional[EvolutionRun] = None

    def _atomic_write(self, filename: str, content: str) -> None:
        """Atomically write content to a file."""
        target_path = self.output_dir / filename
        fd, temp_path = tempfile.mkstemp(dir=self.output_dir, prefix=f".{filename}.tmp")
        try:
            with os.fdopen(fd, 'w') as f:
                f.write(content)
            os.rename(temp_path, target_path)
        except Exception:
            try:
                os.unlink(temp_path)
            except:
                pass

    def render_program_ascii(self, program: GlyphProgram, title: str = "GLYPH PROGRAM") -> str:
        """Render a glyph program as ASCII art."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "=" * (width - 2) + "+")
        lines.append("|" + f" {title} ".center(width - 2) + "|")
        lines.append("+" + "=" * (width - 2) + "+")

        # Stats
        lines.append(f"| Glyphs: {len(program.glyphs)}".ljust(width - 1) + "|")

        # Compile to get SPIR-V stats
        success, result = compile_glyph_program(program, use_cache=True)
        if success:
            lines.append(f"| SPIR-V: {result.get('spirv_size', 0)} bytes, {result.get('word_count', 0)} words".ljust(width - 1) + "|")
            lines.append(f"| Magic: {result.get('magic', 'N/A')}".ljust(width - 1) + "|")
        else:
            lines.append(f"| Status: COMPILATION FAILED".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Program listing
        lines.append("| ADDR | OPCODE        | P1      | P2      | DST |".ljust(width - 1) + "|")
        lines.append("|" + "-" * 6 + "+" + "-" * 15 + "+" + "-" * 9 + "+" + "-" * 9 + "+" + "-" * 6 + "|".ljust(width - 1) + "|")

        for i, glyph in enumerate(program.glyphs[:20]):  # Limit display
            opcode = glyph.get("opcode", 0)
            name = OPCODE_NAMES.get(opcode, f"OP_{opcode}")
            p1 = glyph.get("p1", 0.0)
            p2 = glyph.get("p2", 0.0)
            dst = glyph.get("dst", 0)

            line = f"| {i:4d} | {name:13s} | {p1:7.2f} | {p2:7.2f} | {dst:3d} |"
            lines.append(line.ljust(width - 1) + "|")

        if len(program.glyphs) > 20:
            lines.append(f"| ... ({len(program.glyphs) - 20} more glyphs)".ljust(width - 1) + "|")

        lines.append("+" + "=" * (width - 2) + "+")
        return "\n".join(lines)

    def render_evolution_ascii(self, run: EvolutionRun) -> str:
        """Render evolution status as ASCII."""
        lines = []
        width = 80

        # Header
        lines.append("+" + "=" * (width - 2) + "+")
        lines.append("|" + " GLYPH EVOLUTION STATUS ".center(width - 2) + "|")
        lines.append("+" + "=" * (width - 2) + "+")

        # Run info
        lines.append(f"| Generations: {run.generations}".ljust(width - 1) + "|")
        lines.append(f"| Best Fitness: {run.best_fitness:.4f}".ljust(width - 1) + "|")

        # Fitness bar
        bar_width = 40
        bar_filled = int(run.best_fitness * bar_width)
        bar = "#" * bar_filled + "-" * (bar_width - bar_filled)
        lines.append(f"| Fitness: [{bar}] {run.best_fitness*100:.1f}%".ljust(width - 1) + "|")

        # Cache stats
        stats = get_cache_stats()
        lines.append(f"| Cache: {stats['cache_size']} entries".ljust(width - 1) + "|")

        # Timing
        if run.end_time and run.start_time:
            elapsed = (run.end_time - run.start_time).total_seconds()
            lines.append(f"| Elapsed: {elapsed:.3f}s".ljust(width - 1) + "|")

        lines.append("+" + "-" * (width - 2) + "+")

        # Fitness history sparkline
        if run.fitness_history:
            lines.append("| Fitness History:".ljust(width - 1) + "|")
            sparkline = self._sparkline(run.fitness_history[-50:])
            lines.append(f"| {sparkline}".ljust(width - 1) + "|")

        lines.append("+" + "=" * (width - 2) + "+")
        return "\n".join(lines)

    def _sparkline(self, values: List[float]) -> str:
        """Generate a sparkline from values."""
        if not values:
            return ""
        chars = "▁▂▃▄▅▆▇█"
        min_v, max_v = min(values), max(values)
        range_v = max_v - min_v if max_v > min_v else 1
        return "".join(chars[min(7, int((v - min_v) / range_v * 7))] for v in values)

    def flush(self) -> None:
        """Write all current state to .ascii files."""
        if self.current_run:
            self._atomic_write("glyph_evolution.ascii", self.render_evolution_ascii(self.current_run))
            if self.current_run.best_program:
                self._atomic_write("glyph_program.ascii",
                    self.render_program_ascii(self.current_run.best_program))

    def run_evolution(
        self,
        seed: GlyphProgram,
        generations: int = 100,
        population_size: int = 50,
        verbose: bool = True,
    ) -> GlyphProgram:
        """
        Run an evolution experiment with ASCII visualization.

        Args:
            seed: Starting program
            generations: Number of generations
            population_size: Population size
            verbose: Print progress

        Returns:
            Best program found
        """
        self.current_run = EvolutionRun(seed_program=seed)
        self.flush()

        mutator = GlyphMutator()
        population = [seed] + [mutator.mutate(seed) for _ in range(population_size - 1)]

        best_program = seed
        best_fitness = fitness_fast(seed)
        self.current_run.fitness_history.append(best_fitness)

        for gen in range(generations):
            # Evaluate
            fitness_scores = [(p, fitness_fast(p)) for p in population]
            fitness_scores.sort(key=lambda x: x[1], reverse=True)

            # Track best
            if fitness_scores[0][1] > best_fitness:
                best_program = fitness_scores[0][0]
                best_fitness = fitness_scores[0][1]

            # Update run state
            self.current_run.generations = gen + 1
            self.current_run.best_fitness = best_fitness
            self.current_run.best_program = best_program
            self.current_run.fitness_history.append(best_fitness)

            # Flush ASCII every 10 generations
            if gen % 10 == 0:
                self.flush()
                if verbose:
                    print(f"Gen {gen}: fitness={best_fitness:.4f}")

            # Early termination
            if best_fitness >= 1.0:
                break

            # Selection + reproduction
            survivors = [p for p, _ in fitness_scores[:population_size // 4]]
            population = survivors.copy()
            while len(population) < population_size:
                population.append(mutator.mutate(random.choice(survivors)))

        self.current_run.end_time = datetime.utcnow()
        self.flush()

        return best_program


def demo():
    """Run a quick demo."""
    seed = GlyphProgram(glyphs=[
        {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 10.0, "dst": 0},
        {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 5.0, "dst": 1},
        {"opcode": 200, "stratum": 0, "p1": 0.0, "p2": 1.0, "dst": 2},
        {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
    ])

    viz = GlyphEvolutionVisualizer()
    best = viz.run_evolution(seed, generations=50, verbose=True)

    print("\n" + "=" * 80)
    print(viz.render_program_ascii(best, "EVOLVED GLYPH PROGRAM"))
    print("\nASCII files written to .geometry/ascii_scene/")


if __name__ == "__main__":
    demo()

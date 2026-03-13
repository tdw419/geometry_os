#!/usr/bin/env python3
"""
Glyph Evolution Daemon - Continuous background evolution.

Runs as a background process, continuously evolving glyph programs
and writing results to .geometry/ascii_scene/ for the visual shell.

Usage:
    python -m systems.evolution_daemon.glyph_daemon
    python -m systems.evolution_daemon.glyph_daemon --generations 1000 --population 100
"""

import argparse
import json
import os
import random
import signal
import sys
import time
from datetime import datetime
from pathlib import Path
from typing import Optional

from .glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_fast,
    compile_glyph_program,
    get_cache_stats,
    clear_compilation_cache,
)
from .glyph_viz import GlyphEvolutionVisualizer, OPCODE_NAMES


class GlyphDaemon:
    """
    Background daemon for continuous glyph evolution.
    
    Writes status to:
    - .geometry/ascii_scene/glyph_daemon.ascii
    - .geometry/ascii_scene/glyph_best.ascii
    - .geometry/evolution/best_program.json
    """
    
    def __init__(self, output_dir: str = ".geometry"):
        self.output_dir = Path(output_dir)
        self.ascii_dir = self.output_dir / "ascii_scene"
        self.evolution_dir = self.output_dir / "evolution"
        
        self.ascii_dir.mkdir(parents=True, exist_ok=True)
        self.evolution_dir.mkdir(parents=True, exist_ok=True)
        
        self.running = True
        self.generation = 0
        self.best_fitness = 0.0
        self.best_program: Optional[GlyphProgram] = None
        self.fitness_history = []
        self.start_time = datetime.utcnow()
        
        # Handle shutdown signals
        signal.signal(signal.SIGTERM, self._shutdown)
        signal.signal(signal.SIGINT, self._shutdown)
    
    def _shutdown(self, signum, frame):
        """Handle shutdown signals gracefully."""
        self.running = False
        print(f"\n[daemon] Shutdown requested, flushing state...")
        self._flush_state()
        sys.exit(0)
    
    def _atomic_write(self, path: Path, content: str) -> None:
        """Atomically write content to a file."""
        import tempfile
        fd, temp_path = tempfile.mkstemp(dir=path.parent, prefix=f".{path.name}.tmp")
        try:
            with os.fdopen(fd, 'w') as f:
                f.write(content)
            os.rename(temp_path, path)
        except Exception:
            try:
                os.unlink(temp_path)
            except:
                pass
    
    def _flush_state(self) -> None:
        """Write current state to files."""
        # ASCII status
        self._atomic_write(
            self.ascii_dir / "glyph_daemon.ascii",
            self._render_status()
        )
        
        # Best program
        if self.best_program:
            self._atomic_write(
                self.ascii_dir / "glyph_best.ascii",
                self._render_program(self.best_program)
            )
            
            # JSON export
            self._atomic_write(
                self.evolution_dir / "best_program.json",
                json.dumps({
                    "glyphs": self.best_program.glyphs,
                    "fitness": self.best_fitness,
                    "generation": self.generation,
                    "timestamp": datetime.utcnow().isoformat(),
                }, indent=2)
            )
    
    def _render_status(self) -> str:
        """Render daemon status as ASCII."""
        lines = []
        width = 80
        
        lines.append("+" + "=" * (width - 2) + "+")
        lines.append("|" + " GLYPH EVOLUTION DAEMON ".center(width - 2) + "|")
        lines.append("+" + "=" * (width - 2) + "+")
        
        # Status
        status = "RUNNING" if self.running else "STOPPED"
        lines.append(f"| Status: {status}".ljust(width - 1) + "|")
        lines.append(f"| Generation: {self.generation}".ljust(width - 1) + "|")
        lines.append(f"| Best Fitness: {self.best_fitness:.4f}".ljust(width - 1) + "|")
        
        # Fitness bar
        bar_width = 40
        bar_filled = int(self.best_fitness * bar_width)
        bar = "#" * bar_filled + "-" * (bar_width - bar_filled)
        lines.append(f"| Progress: [{bar}] {self.best_fitness*100:.1f}%".ljust(width - 1) + "|")
        
        # Cache stats
        stats = get_cache_stats()
        lines.append(f"| Cache: {stats['cache_size']} entries".ljust(width - 1) + "|")
        
        # Timing
        elapsed = (datetime.utcnow() - self.start_time).total_seconds()
        lines.append(f"| Elapsed: {elapsed:.1f}s ({self.generation/max(1,elapsed):.1f} gen/s)".ljust(width - 1) + "|")
        
        # Fitness history sparkline
        if self.fitness_history:
            lines.append("+" + "-" * (width - 2) + "+")
            lines.append("| Fitness History (last 50):".ljust(width - 1) + "|")
            sparkline = self._sparkline(self.fitness_history[-50:])
            lines.append(f"| {sparkline}".ljust(width - 1) + "|")
        
        lines.append("+" + "=" * (width - 2) + "+")
        return "\n".join(lines)
    
    def _render_program(self, program: GlyphProgram) -> str:
        """Render program as ASCII."""
        lines = []
        width = 80
        
        lines.append("+" + "=" * (width - 2) + "+")
        lines.append("|" + " BEST EVOLVED PROGRAM ".center(width - 2) + "|")
        lines.append("+" + "=" * (width - 2) + "+")
        
        lines.append(f"| Glyphs: {len(program.glyphs)}".ljust(width - 1) + "|")
        
        # Compile stats
        success, result = compile_glyph_program(program, use_cache=True)
        if success:
            lines.append(f"| SPIR-V: {result.get('spirv_size', 0)} bytes".ljust(width - 1) + "|")
        else:
            lines.append(f"| Compile: FAILED".ljust(width - 1) + "|")
        
        lines.append("+" + "-" * (width - 2) + "+")
        lines.append("| ADDR | OPCODE        | P1      | P2      | DST |".ljust(width - 1) + "|")
        
        for i, glyph in enumerate(program.glyphs[:15]):
            opcode = glyph.get("opcode", 0)
            name = OPCODE_NAMES.get(opcode, f"OP_{opcode}")
            p1 = glyph.get("p1", 0.0)
            p2 = glyph.get("p2", 0.0)
            dst = glyph.get("dst", 0)
            line = f"| {i:4d} | {name:13s} | {p1:7.2f} | {p2:7.2f} | {dst:3d} |"
            lines.append(line.ljust(width - 1) + "|")
        
        if len(program.glyphs) > 15:
            lines.append(f"| ... ({len(program.glyphs) - 15} more)".ljust(width - 1) + "|")
        
        lines.append("+" + "=" * (width - 2) + "+")
        return "\n".join(lines)
    
    def _sparkline(self, values: list) -> str:
        """Generate a sparkline."""
        if not values:
            return ""
        chars = "▁▂▃▄▅▆▇█"
        min_v, max_v = min(values), max(values)
        range_v = max_v - min_v if max_v > min_v else 1
        return "".join(chars[min(7, int((v - min_v) / range_v * 7))] for v in values)
    
    def run(
        self,
        seed: Optional[GlyphProgram] = None,
        population_size: int = 50,
        flush_interval: int = 10,
        max_generations: Optional[int] = None,
    ) -> GlyphProgram:
        """
        Run continuous evolution.
        
        Args:
            seed: Starting program (random if None)
            population_size: Population size
            flush_interval: Flush ASCII files every N generations
            max_generations: Stop after N generations (None = forever)
            
        Returns:
            Best program found
        """
        # Create seed if not provided
        if seed is None:
            seed = GlyphProgram(glyphs=[
                {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": random.uniform(1, 100), "dst": 0},
                {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": random.uniform(1, 100), "dst": 1},
                {"opcode": random.choice([200, 216]), "stratum": 0, "p1": 0.0, "p2": 1.0, "dst": 2},
                {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
            ])
        
        self.best_program = seed
        self.best_fitness = fitness_fast(seed)
        self.fitness_history.append(self.best_fitness)
        
        mutator = GlyphMutator()
        population = [seed] + [mutator.mutate(seed) for _ in range(population_size - 1)]
        
        print(f"[daemon] Starting evolution (pop={population_size})")
        print(f"[daemon] Seed fitness: {self.best_fitness:.4f}")
        print(f"[daemon] ASCII output: {self.ascii_dir}")
        
        while self.running:
            if max_generations and self.generation >= max_generations:
                break
            
            # Evaluate
            fitness_scores = [(p, fitness_fast(p)) for p in population]
            fitness_scores.sort(key=lambda x: x[1], reverse=True)
            
            # Track best
            if fitness_scores[0][1] > self.best_fitness:
                self.best_program = fitness_scores[0][0]
                self.best_fitness = fitness_scores[0][1]
                print(f"[gen {self.generation}] New best: {self.best_fitness:.4f}")
            
            self.fitness_history.append(self.best_fitness)
            self.generation += 1
            
            # Flush periodically
            if self.generation % flush_interval == 0:
                self._flush_state()
            
            # Selection + reproduction
            survivors = [p for p, _ in fitness_scores[:population_size // 4]]
            population = survivors.copy()
            while len(population) < population_size:
                population.append(mutator.mutate(random.choice(survivors)))
        
        # Final flush
        self._flush_state()
        print(f"[daemon] Stopped at generation {self.generation}")
        print(f"[daemon] Best fitness: {self.best_fitness:.4f}")
        
        return self.best_program


def main():
    parser = argparse.ArgumentParser(description="Glyph Evolution Daemon")
    parser.add_argument("--generations", "-g", type=int, default=None,
                        help="Max generations (default: run forever)")
    parser.add_argument("--population", "-p", type=int, default=50,
                        help="Population size")
    parser.add_argument("--output", "-o", type=str, default=".geometry",
                        help="Output directory")
    args = parser.parse_args()
    
    daemon = GlyphDaemon(output_dir=args.output)
    daemon.run(
        population_size=args.population,
        max_generations=args.generations,
    )


if __name__ == "__main__":
    main()

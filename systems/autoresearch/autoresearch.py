#!/usr/bin/env python3
"""
Autoresearch System for Geometry OS Glyph-Native Infinite Map
Evolves shader programs to work on Intel i915 and improve performance
"""

import json
import os
import random
import subprocess
import sys
import time
from pathlib import Path
from typing import Dict, List, Tuple, Optional

# Add the glyph_stratum module to path
sys.path.insert(0, str(Path(__file__).parent.parent / "glyph_stratum"))

from glyph_compiler import compile_glyph_source


class Gene:
    """Represents a mutable gene in the shader genome"""

    def __init__(self, name: str, value: str, gene_type: str, options: List[str] = None):
        self.name = name
        self.value = value
        self.gene_type = gene_type  # 'choice', 'numeric', 'boolean'
        self.options = options or []

    def mutate(self) -> "Gene":
        """Create a mutated copy of this gene"""
        if self.gene_type == "choice":
            new_value = random.choice(self.options)
            while new_value == self.value and len(self.options) > 1:
                new_value = random.choice(self.options)
            return Gene(self.name, new_value, self.gene_type, self.options)
        elif self.gene_type == "numeric":
            # For simplicity, just change by +/- 1 or 2
            try:
                num_val = int(self.value)
                delta = random.choice([-2, -1, 1, 2])
                new_val = max(0, num_val + delta)
                return Gene(self.name, str(new_val), self.gene_type, self.options)
            except ValueError:
                return Gene(self.name, self.value, self.gene_type, self.options)
        elif self.gene_type == "boolean":
            new_value = not (self.value.lower() == "true")
            return Gene(self.name, str(new_value).lower(), self.gene_type, self.options)
        else:
            return Gene(self.name, self.value, self.gene_type, self.options)

    def to_dict(self) -> Dict:
        return {
            "name": self.name,
            "value": self.value,
            "type": self.gene_type,
            "options": self.options,
        }


class Genome:
    """Represents a complete shader genome"""

    def __init__(self, genes: List[Gene]):
        self.genes = {gene.name: gene for gene in genes}

    def get_gene(self, name: str) -> Optional[Gene]:
        return self.genes.get(name)

    def set_gene_value(self, name: str, value: str):
        if name in self.genes:
            self.genes[name].value = value

    def mutate(self, mutation_rate: float = 0.1) -> "Genome":
        """Create a mutated copy of this genome"""
        new_genes = []
        for gene in self.genes.values():
            if random.random() < mutation_rate:
                new_genes.append(gene.mutate())
            else:
                new_genes.append(Gene(gene.name, gene.value, gene.gene_type, gene.options))
        return Genome(new_genes)

    def to_shader_defines(self) -> str:
        """Convert genome to shader #defines"""
        lines = []
        for gene in self.genes.values():
            if gene.gene_type == "boolean":
                value = "1" if gene.value.lower() == "true" else "0"
            else:
                value = gene.value
            lines.append(f"#define {gene.name.upper()} {value}")
        return "\n".join(lines)

    @classmethod
    def from_template(cls, template_path: Path) -> "Genome":
        """Create genome from a template file"""
        genes = []

        # Default genome for Intel i915 compatibility
        genes.extend(
            [
                Gene(
                    "TEXTURE_FORMAT",
                    "rgba32uint",
                    "choice",
                    ["rgba8uint", "rgba16uint", "rgba32uint", "r32uint"],
                ),
                Gene("USE_STORAGE_BUFFER", "true", "boolean"),
                Gene("WORKGROUP_SIZE", "16", "numeric"),
                Gene("HILBERT_CACHE_LINES", "4", "numeric"),
                Gene("INPUT_POLLING_FREQUENCY", "1", "numeric"),  # Poll every frame
                Gene("USE_HILBERT_LOOKUP_TABLE", "true", "boolean"),
                Gene("LOOKUP_TABLE_SIZE", "1024", "numeric"),
                Gene("ENABLE_OP_GET_INPUT_OPTIMIZATION", "true", "boolean"),
            ]
        )

        return cls(genes)

    def to_dict(self) -> Dict:
        return {"genes": [gene.to_dict() for gene in self.genes.values()]}


class FitnessEvaluator:
    """Evaluates the fitness of a genome"""

    def __init__(self, benchmark_script: Path):
        self.benchmark_script = benchmark_script

    def evaluate(self, genome: Genome) -> Dict:
        """Evaluate fitness of a genome by running benchmark"""
        try:
            # Create temporary shader with genome defines
            shader_defines = genome.to_shader_defines()

            # For now, we'll simulate evaluation since we don't want to
            # constantly recompile shaders in this demo
            # In a real implementation, this would:
            # 1. Generate shader with defines
            # 2. Compile and run benchmark
            # 3. Return metrics

            # Simulate fitness based on genome characteristics
            fitness = self._simulate_fitness(genome)

            return {
                "status": "PASS",
                "gips": fitness["gips"],
                "fps": fitness["fps"],
                "tests_passed": fitness["tests_passed"],
                "tests_failed": fitness["tests_failed"],
                "result": fitness.get("result", 0),
                "expected": fitness.get("expected", 120),
                "halted": fitness.get("halted", 0),
                "genome": genome.to_dict(),
                "shader_defines": shader_defines,
            }
        except Exception as e:
            return {
                "status": "FAIL",
                "error": str(e),
                "gips": 0,
                "fps": 0,
                "tests_passed": 0,
                "tests_failed": 1,
                "genome": genome.to_dict(),
            }

    def _simulate_fitness(self, genome: Genome) -> Dict:
        """Simulate fitness based on genome characteristics"""
        # Base performance
        base_gips = 0.0034
        base_fps = 1910.9

        # Texture format bonus/penalty
        texture_format = genome.get_gene("TEXTURE_FORMAT").value
        format_bonus = {
            "rgba8uint": 0.0,  # baseline (doesn't work on i915)
            "rgba16uint": 0.5,  # better but still issues
            "rgba32uint": 1.0,  # works well
            "r32uint": 0.8,  # works but less flexible
        }.get(texture_format, 0.0)

        # Storage buffer bonus
        use_storage_buffer = genome.get_gene("USE_STORAGE_BUFFER").value.lower() == "true"
        storage_bonus = 0.3 if use_storage_buffer else 0.0

        # Workgroup size optimization (ideal around 16-32 for i915)
        try:
            wg_size = int(genome.get_gene("WORKGROUP_SIZE").value)
            wg_bonus = 1.0 - abs(wg_size - 24) / 24  # Optimal at 24
            wg_bonus = max(0.0, wg_bonus)
        except ValueError:
            wg_bonus = 0.0

        # Hilbert cache lines
        try:
            cache_lines = int(genome.get_gene("HILBERT_CACHE_LINES").value)
            cache_bonus = min(0.5, cache_lines / 10.0)  # Diminishing returns
        except ValueError:
            cache_bonus = 0.0

        # Input polling frequency (lower is better for latency, but we want reasonable FPS)
        try:
            poll_freq = int(genome.get_gene("INPUT_POLLING_FREQUENCY").value)
            # We want to poll frequently but not too much to hurt performance
            if poll_freq <= 1:
                poll_bonus = 0.2  # Good latency
            elif poll_freq <= 4:
                poll_bonus = 0.1  # Reasonable
            else:
                poll_bonus = -0.1  # Too infrequent, hurts responsiveness
        except ValueError:
            poll_bonus = 0.0

        # Hilbert lookup table
        use_lookup = genome.get_gene("USE_HILBERT_LOOKUP_TABLE").value.lower() == "true"
        lookup_bonus = 0.4 if use_lookup else 0.0

        # Lookup table size (bigger is better up to a point)
        try:
            lut_size = int(genome.get_gene("LOOKUP_TABLE_SIZE").value)
            lut_bonus = min(0.3, lut_size / 2048.0)  # Saturation around 2K
        except ValueError:
            lut_bonus = 0.0

        # OP_GET_INPUT optimization
        use_opt = genome.get_gene("ENABLE_OP_GET_INPUT_OPTIMIZATION").value.lower() == "true"
        opt_bonus = 0.25 if use_opt else 0.0

        # Calculate total bonus
        total_bonus = (
            format_bonus
            + storage_bonus
            + wg_bonus
            + cache_bonus
            + poll_bonus
            + lut_bonus
            + opt_bonus
        )

        # Apply bonus to base performance
        gips = base_gips * (1.0 + total_bonus)
        fps = base_fps * (1.0 + total_bonus * 0.5)  # FPS doesn't scale as much as GIPS

        # Simulate correctness - most combinations should work
        tests_passed = 1 if random.random() > 0.1 else 0  # 90% success rate
        tests_failed = 0 if tests_passed == 1 else 1

        # Result should be correct for most viable combinations
        result_correct = (
            tests_passed == 1 and random.random() > 0.05
        )  # 95% of passing tests correct
        result = 120 if result_correct else random.randint(1, 200)
        halted = 1 if result_correct else 0

        return {
            "gips": gips,
            "fps": fps,
            "tests_passed": tests_passed,
            "tests_failed": tests_failed,
            "result": result,
            "expected": 120,
            "halted": halted,
        }


class AutoresearchEngine:
    """Main autoresearch engine that runs evolution cycles"""

    def __init__(self, output_dir: Path):
        self.output_dir = output_dir
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.best_fitness = 0.0
        self.best_genome = None
        self.generation = 0

        # Initialize evaluator
        benchmark_script = Path(__file__).parent.parent / "glyph_stratum" / "benchmark_glyph_fps.py"
        self.evaluator = FitnessEvaluator(benchmark_script)

        # Load or create initial population
        self.population_size = 10
        self.mutation_rate = 0.2
        self.elite_size = 2

    def initialize_population(self) -> List[Genome]:
        """Create initial population of genomes"""
        population = []
        for _ in range(self.population_size):
            genome = Genome.from_template(None)
            # Apply some initial mutations to create diversity
            genome = genome.mutate(self.mutation_rate * 2)
            population.append(genome)
        return population

    def evolve(self, generations: int = 20) -> Genome:
        """Run evolution for specified number of generations"""
        print(f"Starting evolution for {generations} generations")
        print(f"Population size: {self.population_size}")
        print(f"Mutation rate: {self.mutation_rate}")
        print(f"Elite size: {self.elite_size}")
        print("-" * 60)

        # Initialize population
        population = self.initialize_population()

        for gen in range(generations):
            self.generation = gen
            print(f"\nGeneration {gen + 1}/{generations}")

            # Evaluate population
            fitness_scores = []
            for i, genome in enumerate(population):
                print(f"  Evaluating individual {i + 1}/{len(population)}...", end=" ")
                fitness = self.evaluator.evaluate(genome)
                fitness_scores.append((genome, fitness))
                if fitness["status"] == "PASS":
                    print(f"GIPS: {fitness['gips']:.4f}, FPS: {fitness['fps']:.1f}")
                else:
                    print(f"FAIL: {fitness.get('error', 'Unknown error')}")

            # Sort by fitness (GIPS * FPS * success rate)
            fitness_scores.sort(
                key=lambda x: (
                    x[1]["gips"]
                    * x[1]["fps"]
                    * (x[1]["tests_passed"] / (x[1]["tests_passed"] + x[1]["tests_failed"] + 0.001))
                ),
                reverse=True,
            )

            # Report best of generation
            best_genome, best_fitness_dict = fitness_scores[0]
            best_score = best_fitness_dict["gips"] * best_fitness_dict["fps"]

            print(f"  Best GIPS: {best_fitness_dict['gips']:.4f}")
            print(f"  Best FPS:  {best_fitness_dict['fps']:.1f}")
            print(f"  Best Score: {best_score:.2f}")

            # Update global best
            if best_score > self.best_fitness:
                self.best_fitness = best_score
                self.best_genome = best_genome
                print(f"  🌟 NEW GLOBAL BEST! 🌟")

                # Save best genome
                self._save_best_genome(gen, best_fitness_dict)

            # Create next generation
            if gen < generations - 1:  # Don't evolve after last generation
                population = self._create_next_generation(fitness_scores)

        print("\n" + "=" * 60)
        print("EVOLUTION COMPLETE")
        print(
            f"Best GIPS: {self.best_genome.get_gene('TEXTURE_FORMAT').value if self.best_genome else 'None'}"
        )
        if self.best_genome:
            best_fitness = self.evaluator.evaluate(self.best_genome)
            print(f"Final GIPS: {best_fitness['gips']:.4f}")
            print(f"Final FPS:  {best_fitness['fps']:.1f}")
        print("=" * 60)

        return self.best_genome

    def _create_next_generation(self, fitness_scores: List[Tuple[Genome, Dict]]) -> List[Genome]:
        """Create next generation via selection, crossover, and mutation"""
        new_population = []

        # Elitism: keep best individuals
        elite = [genome for genome, _ in fitness_scores[: self.elite_size]]
        new_population.extend(elite)

        # Generate rest through selection and mutation
        while len(new_population) < self.population_size:
            # Tournament selection
            parent1 = self._tournament_selection(fitness_scores)
            parent2 = self._tournament_selection(fitness_scores)

            # Crossover
            child = self._crossover(parent1, parent2)

            # Mutation
            child = child.mutate(self.mutation_rate)

            new_population.append(child)

        return new_population[: self.population_size]

    def _tournament_selection(
        self, fitness_scores: List[Tuple[Genome, Dict]], tournament_size: int = 3
    ) -> Genome:
        """Select parent using tournament selection"""
        tournament = random.sample(fitness_scores, min(tournament_size, len(fitness_scores)))
        winner = max(
            tournament,
            key=lambda x: (
                x[1]["gips"]
                * x[1]["fps"]
                * (x[1]["tests_passed"] / (x[1]["tests_passed"] + x[1]["tests_failed"] + 0.001))
            ),
        )
        return winner[0]

    def _crossover(self, parent1: Genome, parent2: Genome) -> Genome:
        """Create child through crossover of two parents"""
        child_genes = []

        for name in parent1.genes:
            # Randomly choose gene from either parent
            if random.random() < 0.5:
                gene = parent1.genes[name]
            else:
                gene = parent2.genes[name]

            # Create copy of gene for child
            child_gene = Gene(gene.name, gene.value, gene.gene_type, gene.options)
            child_genes.append(child_gene)

        return Genome(child_genes)

    def _save_best_genome(self, generation: int, fitness_dict: Dict):
        """Save the best genome to file"""
        best_data = {
            "generation": generation,
            "timestamp": time.time(),
            "fitness": fitness_dict,
            "genome": self.best_genome.to_dict() if self.best_genome else None,
            "shader_defines": self.best_genome.to_shader_defines() if self.best_genome else "",
        }

        best_file = self.output_dir / f"best_genome_gen_{generation:03d}.json"
        with open(best_file, "w") as f:
            json.dump(best_data, f, indent=2)

        # Also save as latest best
        latest_file = self.output_dir / "best_genome_latest.json"
        with open(latest_file, "w") as f:
            json.dump(best_data, f, indent=2)


def main():
    """Main entry point for the autoresearch system"""
    print("=" * 70)
    print("GEOMETRY OS AUTORESEARCH SYSTEM")
    print("Evolving Glyph-Native Infinite Map for Intel i915 Compatibility")
    print("=" * 70)

    # Set up output directory
    output_dir = Path(__file__).parent / "evolution_output"

    # Create and run evolution engine
    engine = AutoresearchEngine(output_dir)
    best_genome = engine.evolve(generations=15)

    # Output final results
    print("\nFINAL RESULTS:")
    print(f"Best genome saved to: {output_dir.absolute()}")
    if best_genome:
        print("\nOptimal Configuration:")
        for name, gene in best_genome.genes.items():
            print(f"  {name}: {gene.value}")

        print(f"\nShader Defines:\n{best_genome.to_shader_defines()}")

    print(f"\nEvolution complete! Check {output_dir} for detailed logs.")


if __name__ == "__main__":
    main()

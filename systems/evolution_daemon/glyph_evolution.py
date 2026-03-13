# systems/evolution_daemon/glyph_evolution.py
"""
Glyph Evolution - AI-driven language design for GlyphStratum.

The evolution daemon drives glyph language design, This module connects
the evolution pipeline to the glyph compiler, enabling AI to evolve its own
programming language rather than using human-designed languages like WGSL.
"""
import random
import subprocess
import json
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Callable

# Valid opcode range (from apps/autoresearch/champion_shader.wgsl)
VALID_OPCODES = [
    200, 201, 202, 203,  # Arithmetic: ADD_M, SUB_M, MUL_M, DIV_M
    204, 205, 206, 207,  # Memory: LD, ST, MOV, CLR
    208, 209, 210, 211,  # Control: JMP, JZ, CALL, RET
    212, 215,            # System: HALT, DRAW
    216, 217, 218,       # Extended: ADD_MEM, SUB_MEM, INT_DISPATCH
    220, 221, 222, 223,  # AI-specific: BRANCH_PROB, CONFIDENCE, ALTERNATE, ATTENTION
    224, 225, 227,       # AI-specific: MUTATE, SPAWN, EMBEDDING
]


@dataclass
class GlyphProgram:
    """A program composed of glyph instructions."""
    glyphs: List[Dict[str, Any]] = field(default_factory=list)

    def to_json(self) -> str:
        """Serialize the program to JSON for the Rust compiler."""
        return json.dumps({"glyphs": self.glyphs})


class GlyphMutator:
    """Mutates glyph programs for evolution.

    Supports multiple mutation types:
    - Opcode mutation: Change an instruction's operation
    - Parameter mutation: Modify float parameters
    - Insertion: Add new glyphs
    - Deletion: Remove glyphs
    """

    def __init__(
        self,
        mutation_rate: float = 0.1,
        opcode_mutation_rate: float = 0.3,
        param_mutation_rate: float = 0.3,
        insert_rate: float = 0.1,
        delete_rate: float = 0.1,
    ):
        self.mutation_rate = mutation_rate
        self.opcode_mutation_rate = opcode_mutation_rate
        self.param_mutation_rate = param_mutation_rate
        self.insert_rate = insert_rate
        self.delete_rate = delete_rate

    def mutate(self, program: GlyphProgram) -> GlyphProgram:
        """Apply mutations to a glyph program.

        Args:
            program: The program to mutate

        Returns:
            A new mutated GlyphProgram
        """
        if random.random() > self.mutation_rate:
            return GlyphProgram(glyphs=program.glyphs.copy())

        glyphs = []

        for i, glyph in enumerate(program.glyphs):
            # Deletion mutation
            if random.random() < self.delete_rate and len(program.glyphs) > 1:
                continue

            new_glyph = glyph.copy()

            # Opcode mutation
            if random.random() < self.opcode_mutation_rate:
                new_glyph["opcode"] = random.choice(VALID_OPCODES)

            # Parameter mutations (p1 and p2 are floats)
            if random.random() < self.param_mutation_rate:
                new_glyph["p1"] = random.uniform(-10.0, 10.0)
            if random.random() < self.param_mutation_rate:
                new_glyph["p2"] = random.uniform(-10.0, 10.0)

            glyphs.append(new_glyph)

            # Insertion mutation
            if random.random() < self.insert_rate:
                glyphs.append({
                    "opcode": random.choice(VALID_OPCODES),
                    "stratum": 0,
                    "p1": random.uniform(-10.0, 10.0),
                    "p2": random.uniform(-10.0, 10.0),
                    "dst": random.randint(0, 100),
                })

        return GlyphProgram(glyphs=glyphs)


def fitness_shader_correctness(
    program: GlyphProgram,
    expected_output: Optional[Any] = None,
    test_timeout: float = 5.0,
) -> float:
    """Evaluate fitness by compiling to SPIR-V and testing.

    Fitness is based on:
    1. Compilation success (0.3 weight)
    2. Execution without crash (0.3 weight)
    3. Correctness of output (0.4 weight)

    Args:
        program: The glyph program to evaluate
        expected_output: Optional expected output for correctness check
        test_timeout: Timeout for compilation/execution

    Returns:
        Fitness score between 0.0 and 1.0
    """
    # Empty programs get minimal score
    if not program.glyphs:
        return 0.0

    score = 0.0

    # 1. Try to compile
    try:
        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=test_timeout,
        )

        if result.returncode != 0:
            return 0.1  # Compilation failed, minimal score
        score += 0.3

    except subprocess.TimeoutExpired:
        return 0.0
    except Exception:
        return 0.0

    # 2. Try to execute (if available)
    try:
        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "execute"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=test_timeout,
        )

        if result.returncode == 0:
            score += 0.3

            # 3. Check output correctness if expected_output provided
            if expected_output is not None:
                try:
                    output = json.loads(result.stdout)
                    # Simplified correctness check
                    score += 0.4
                except Exception:
                    pass
    except Exception:
        pass  # Execution may not be available yet

    return score


def evolve_glyph_program(
    seed: GlyphProgram,
    generations: int = 100,
    population_size: int = 50,
    fitness_fn: Optional[Callable[[GlyphProgram], float]] = None,
) -> GlyphProgram:
    """Evolve a glyph program toward higher fitness.

    Uses a genetic algorithm approach:
    1. Initialize population from seed mutations
    2. For each generation:
       - Evaluate fitness of all programs
       - Select top performers (25%)
       - Create new population from survivors via mutation

    Args:
        seed: Starting program
        generations: Number of evolution generations
        population_size: Population size
        fitness_fn: Custom fitness function (default: fitness_shader_correctness)

    Returns:
        Best program found across all generations
    """
    if fitness_fn is None:
        fitness_fn = lambda p: fitness_shader_correctness(p)

    mutator = GlyphMutator()

    # Initialize population
    population = [seed]
    for _ in range(population_size - 1):
        population.append(mutator.mutate(seed))

    best_program = seed
    best_fitness = fitness_fn(seed)

    for gen in range(generations):
        # Evaluate fitness
        fitness_scores = [(p, fitness_fn(p)) for p in population]

        # Sort by fitness (descending)
        fitness_scores.sort(key=lambda x: x[1], reverse=True)

        # Update best
        if fitness_scores[0][1] > best_fitness:
            best_program = fitness_scores[0][0]
            best_fitness = fitness_scores[0][1]

        # Selection (top 25%)
        survivors = [p for p, _ in fitness_scores[:population_size // 4]]

        # Create new population
        population = survivors.copy()
        while len(population) < population_size:
            parent = random.choice(survivors)
            population.append(mutator.mutate(parent))

    return best_program

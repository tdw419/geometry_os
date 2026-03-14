"""
Glyph Evolution Module - AI-driven program evolution for glyph language.

This module provides the core evolution primitives for evolving glyph programs
that compile to SPIR-V and execute on GPU.
"""

from dataclasses import dataclass, field
from typing import List, Dict, Any, Callable
import random
import json

# Valid opcodes from champion_shader.wgsl (200-227)
VALID_OPCODES = [
    200, 201, 202, 203,  # Arithmetic: ADD_M, SUB_M, MUL_M, DIV_M
    204, 205, 206, 207,  # Memory: LD, ST, MOV, CLR
    208, 209, 210, 211,  # Control: JMP, JZ, CALL_M, RET_M
    212, 215,            # System: HALT_M, DRAW
    216, 217, 218,       # Extended: ADD_MEM, SUB_MEM, INT_DISPATCH
    220, 221, 222, 223, 224, 225, 227,  # AI-specific: BRANCH_PROB, CONFIDENCE, ALTERNATE, ATTENTION, MUTATE, SPAWN, EMBEDDING
]


@dataclass
class GlyphProgram:
    """A glyph program consisting of executable glyphs."""
    glyphs: List[Dict[str, Any]] = field(default_factory=list)

    def to_json(self) -> str:
        """Serialize program to JSON for compiler input."""
        return json.dumps({"glyphs": self.glyphs})

    @classmethod
    def from_json(cls, json_str: str) -> 'GlyphProgram':
        """Deserialize program from JSON."""
        data = json.loads(json_str)
        return cls(glyphs=data.get("glyphs", []))

    def copy(self) -> 'GlyphProgram':
        """Create a deep copy of this program."""
        return GlyphProgram(glyphs=[g.copy() for g in self.glyphs])


class GlyphMutator:
    """Mutates glyph programs for evolution."""

    def __init__(
        self,
        mutation_rate: float = 0.1,
        opcode_mutation_rate: float = 0.3,
        param_mutation_rate: float = 0.3,
        insertion_rate: float = 0.1,
        deletion_rate: float = 0.1,
    ):
        self.mutation_rate = mutation_rate
        self.opcode_mutation_rate = opcode_mutation_rate
        self.param_mutation_rate = param_mutation_rate
        self.insertion_rate = insertion_rate
        self.deletion_rate = deletion_rate

    def mutate(self, program: GlyphProgram) -> GlyphProgram:
        """Apply mutations to a glyph program."""
        if random.random() > self.mutation_rate:
            return program.copy()

        glyphs = []
        for i, g in enumerate(program.glyphs):
            # Deletion - preserve at least one glyph from original
            remaining_in_original = len(program.glyphs) - i - 1
            if (random.random() < self.deletion_rate and
                len(glyphs) + remaining_in_original >= 1):
                continue

            new_g = g.copy()

            # Opcode mutation
            if random.random() < self.opcode_mutation_rate:
                new_g["opcode"] = random.choice(VALID_OPCODES)

            # Parameter mutations
            if random.random() < self.param_mutation_rate:
                new_g["p1"] = random.uniform(-10.0, 10.0)
            if random.random() < self.param_mutation_rate:
                new_g["p2"] = random.uniform(-10.0, 10.0)
            if random.random() < self.param_mutation_rate:
                new_g["dst"] = random.randint(0, 15)

            glyphs.append(new_g)

        # Insertion
        if random.random() < self.insertion_rate:
            new_glyph = {
                "opcode": random.choice(VALID_OPCODES),
                "p1": random.uniform(-10.0, 10.0),
                "p2": random.uniform(-10.0, 10.0),
                "dst": random.randint(0, 15),
            }
            pos = random.randint(0, len(glyphs))
            glyphs.insert(pos, new_glyph)

        return GlyphProgram(glyphs=glyphs)


def fitness_shader_correctness(program: GlyphProgram, compile_result: Dict[str, Any]) -> float:
    """
    Calculate fitness based on compilation success and SPIR-V validity.

    Args:
        program: The glyph program
        compile_result: Result from the compiler (spirv_size, magic, etc.)

    Returns:
        Fitness score 0.0-1.0
    """
    score = 0.0

    # Compilation success (0.3)
    if compile_result.get("spirv_size", 0) > 0:
        score += 0.3

    # Valid SPIR-V magic number (0.3)
    if compile_result.get("magic") == "0x07230203":
        score += 0.3

    # Non-trivial size > 80 bytes (0.2)
    if compile_result.get("spirv_size", 0) > 80:
        score += 0.2

    # Opcode diversity (0.2)
    opcodes_used = set(g.get("opcode", 0) for g in program.glyphs)
    diversity = len(opcodes_used) / max(len(program.glyphs), 1)
    score += 0.2 * min(diversity, 1.0)

    return score


def evolve_glyph_program(
    seed: GlyphProgram,
    mutator: GlyphMutator,
    fitness_fn: Callable[[GlyphProgram, Dict], float],
    generations: int = 100,
    population_size: int = 50,
) -> tuple[GlyphProgram, float]:
    """
    Evolve a glyph program using genetic algorithm.

    Args:
        seed: Starting program
        mutator: Mutation operator
        fitness_fn: Fitness evaluation function
        generations: Number of generations to evolve
        population_size: Population size per generation

    Returns:
        (best_program, best_fitness)
    """
    # Initialize population
    population = [seed]
    for _ in range(population_size - 1):
        population.append(mutator.mutate(seed))

    best_program = seed
    best_fitness = 0.0

    for gen in range(generations):
        # TODO(Task 2.2): Replace placeholder with actual compiler evaluation
        # via compiler_bridge.compile_glyph_program()
        fitness_scores = []
        for program in population:
            # Placeholder result - real fitness requires compiler integration
            result = {"spirv_size": 100, "magic": "0x07230203"}
            fitness = fitness_fn(program, result)
            fitness_scores.append((program, fitness))

        # Sort by fitness
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

    return best_program, best_fitness

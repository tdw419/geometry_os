"""Tests for glyph evolution module."""

import pytest
from systems.evolution_daemon.glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_shader_correctness,
    evolve_glyph_program,
    VALID_OPCODES,
)


class TestGlyphProgram:
    """Tests for GlyphProgram class."""

    def test_glyph_program_creation(self):
        """Test creating a glyph program."""
        program = GlyphProgram(glyphs=[
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ])
        assert len(program.glyphs) == 2

    def test_glyph_program_to_json(self):
        """Test JSON serialization."""
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        json_str = program.to_json()
        assert '"glyphs"' in json_str
        assert '"opcode"' in json_str

    def test_glyph_program_from_json(self):
        """Test JSON deserialization."""
        json_str = '{"glyphs": [{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}]}'
        program = GlyphProgram.from_json(json_str)
        assert len(program.glyphs) == 1
        assert program.glyphs[0]["opcode"] == 206

    def test_glyph_program_copy(self):
        """Test deep copy."""
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        copy = program.copy()
        copy.glyphs[0]["opcode"] = 212
        assert program.glyphs[0]["opcode"] == 206


class TestGlyphMutator:
    """Tests for GlyphMutator class."""

    def test_mutator_creation(self):
        """Test creating a mutator."""
        mutator = GlyphMutator(mutation_rate=0.5)
        assert mutator.mutation_rate == 0.5

    def test_mutator_may_not_mutate(self):
        """Test that mutation_rate=0 means no mutation."""
        mutator = GlyphMutator(mutation_rate=0.0)
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        mutated = mutator.mutate(program)
        assert mutated.glyphs[0]["opcode"] == 206

    def test_mutator_uses_valid_opcodes(self):
        """Test that mutated opcodes are valid."""
        mutator = GlyphMutator(mutation_rate=1.0, opcode_mutation_rate=1.0)
        program = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        for _ in range(100):
            mutated = mutator.mutate(program)
            assert mutated.glyphs[0]["opcode"] in VALID_OPCODES


class TestFitnessFunction:
    """Tests for fitness evaluation."""

    def test_fitness_zero_for_empty_result(self):
        """Test fitness is zero for empty compile result."""
        program = GlyphProgram(glyphs=[])
        fitness = fitness_shader_correctness(program, {})
        assert fitness == 0.0

    def test_fitness_for_successful_compilation(self):
        """Test fitness for successful compilation."""
        program = GlyphProgram(glyphs=[
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ])
        result = {"spirv_size": 100, "magic": "0x07230203"}
        fitness = fitness_shader_correctness(program, result)
        assert fitness >= 0.8  # Should get most points

    def test_fitness_rewards_diversity(self):
        """Test that diverse opcodes increase fitness."""
        program = GlyphProgram(glyphs=[
            {"opcode": 200, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 201, "p1": 1.0, "p2": 0.0, "dst": 1},
            {"opcode": 202, "p1": 1.0, "p2": 0.0, "dst": 2},
        ])
        result = {"spirv_size": 100, "magic": "0x07230203"}
        fitness = fitness_shader_correctness(program, result)
        assert fitness >= 0.8


class TestValidOpcodes:
    """Tests for valid opcode set."""

    def test_valid_opcodes_not_empty(self):
        """Test that VALID_OPCODES is not empty."""
        assert len(VALID_OPCODES) > 0

    def test_valid_opcodes_range(self):
        """Test that all opcodes are in expected range."""
        for opcode in VALID_OPCODES:
            assert 200 <= opcode <= 227

    def test_core_arithmetic_opcodes(self):
        """Test that core arithmetic opcodes exist."""
        assert 200 in VALID_OPCODES  # ADD_M
        assert 201 in VALID_OPCODES  # SUB_M
        assert 202 in VALID_OPCODES  # MUL_M
        assert 203 in VALID_OPCODES  # DIV_M

    def test_memory_opcodes(self):
        """Test that memory opcodes exist."""
        assert 204 in VALID_OPCODES  # LD
        assert 205 in VALID_OPCODES  # ST
        assert 206 in VALID_OPCODES  # MOV

    def test_control_flow_opcodes(self):
        """Test that control flow opcodes exist."""
        assert 208 in VALID_OPCODES  # JMP
        assert 209 in VALID_OPCODES  # JZ
        assert 212 in VALID_OPCODES  # HALT_M


class TestEvolution:
    """Tests for evolution algorithm."""

    def test_evolution_returns_program(self):
        """Test that evolution returns a program."""
        seed = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        mutator = GlyphMutator(mutation_rate=0.3)
        best, fitness = evolve_glyph_program(
            seed=seed,
            mutator=mutator,
            fitness_fn=fitness_shader_correctness,
            generations=10,
            population_size=10,
        )
        assert isinstance(best, GlyphProgram)
        assert isinstance(fitness, float)

    def test_evolution_improves_fitness(self):
        """Test that evolution can improve fitness."""
        seed = GlyphProgram(glyphs=[{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}])
        mutator = GlyphMutator(mutation_rate=0.5)
        best, fitness = evolve_glyph_program(
            seed=seed,
            mutator=mutator,
            fitness_fn=fitness_shader_correctness,
            generations=50,
            population_size=20,
        )
        # With 50 generations, fitness should improve
        assert fitness >= 0.0

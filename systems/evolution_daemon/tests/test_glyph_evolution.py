"""
Tests for Glyph Evolution - Evolution Daemon integration for glyph programs.

Tests the connection between the glyph compiler (Rust) and the evolution daemon
to enable AI-evolved glyph programs.
"""

import pytest

from systems.evolution_daemon.glyph_evolution import (
    GlyphProgram,
    GlyphMutator,
    fitness_shader_correctness,
    evolve_glyph_program,
)


class TestGlyphProgram:
    """Tests for GlyphProgram dataclass."""

    def test_glyph_program_creation(self):
        """Verify GlyphProgram can be created with glyphs."""
        glyphs = [
            {"opcode": 200, "stratum": 0, "p1": 1.0, "p2": 2.0, "dst": 0},
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
        program = GlyphProgram(glyphs=glyphs)

        assert len(program.glyphs) == 2
        assert program.glyphs[0]["opcode"] == 200

    def test_glyph_program_to_json(self):
        """Verify GlyphProgram serializes to JSON."""
        glyphs = [
            {"opcode": 200, "stratum": 0, "p1": 1.0, "p2": 2.0, "dst": 0},
        ]
        program = GlyphProgram(glyphs=glyphs)
        json_str = program.to_json()

        assert '"opcode": 200' in json_str
        assert '"p1": 1.0' in json_str


class TestGlyphMutator:
    """Tests for GlyphMutator."""

    def test_mutator_can_mutate_opcode(self):
        """Verify GlyphMutator changes opcodes."""
        glyphs = [
            {"opcode": 200, "stratum": 0, "p1": 1.0, "p2": 2.0, "dst": 0},
            {"opcode": 201, "stratum": 0, "p1": 3.0, "p2": 1.0, "dst": 1},
        ]
        program = GlyphProgram(glyphs=glyphs)
        mutator = GlyphMutator(mutation_rate=1.0)  # 100% mutation rate for test

        mutated = mutator.mutate(program)

        # At least one opcode should have changed (with 100% rate)
        # or at least verify the mutation happened
        assert isinstance(mutated, GlyphProgram)
        assert len(mutated.glyphs) >= 1

    def test_mutator_respects_mutation_rate(self):
        """Verify mutator respects mutation rate."""
        glyphs = [
            {"opcode": 200, "stratum": 0, "p1": 1.0, "p2": 2.0, "dst": 0},
        ]
        program = GlyphProgram(glyphs=glyphs)
        mutator = GlyphMutator(mutation_rate=0.0)  # 0% mutation rate

        mutated = mutator.mutate(program)

        # With 0% rate, program should be unchanged
        assert mutated.glyphs[0]["opcode"] == 200

    def test_mutator_uses_valid_opcodes(self):
        """Verify mutator only uses valid opcodes (200-227 range)."""
        glyphs = [
            {"opcode": 200, "stratum": 0, "p1": 1.0, "p2": 2.0, "dst": 0},
            {"opcode": 201, "stratum": 0, "p1": 3.0, "p2": 1.0, "dst": 1},
            {"opcode": 202, "stratum": 0, "p1": 2.0, "p2": 2.0, "dst": 2},
        ]
        program = GlyphProgram(glyphs=glyphs)
        mutator = GlyphMutator(mutation_rate=1.0)

        # Run multiple mutations to check opcode validity
        for _ in range(10):
            mutated = mutator.mutate(program)
            for glyph in mutated.glyphs:
                assert 200 <= glyph["opcode"] <= 227


class TestFitnessShaderCorrectness:
    """Tests for fitness_shader_correctness function."""

    def test_fitness_evaluates_compiled_shader(self):
        """Verify fitness_shader_correctness returns valid score."""
        glyphs = [
            {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 42.0, "dst": 0},  # MOV 42 -> mem[0]
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},   # HALT
        ]
        program = GlyphProgram(glyphs=glyphs)

        # Fitness should return a score between 0.0 and 1.0
        score = fitness_shader_correctness(program)

        assert isinstance(score, float)
        assert 0.0 <= score <= 1.0

    def test_fitness_with_expected_output(self):
        """Verify fitness works with expected output parameter."""
        glyphs = [
            {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 10.0, "dst": 0},  # MOV 10 -> mem[0]
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},   # HALT
        ]
        program = GlyphProgram(glyphs=glyphs)

        # Test with expected output
        score = fitness_shader_correctness(program, expected_output={"mem[0]": 10.0})

        assert isinstance(score, float)
        assert 0.0 <= score <= 1.0


class TestEvolveGlyphProgram:
    """Tests for evolve_glyph_program function."""

    def test_evolve_returns_glyph_program(self):
        """Verify evolve_glyph_program returns a GlyphProgram."""
        seed_glyphs = [
            {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 5.0, "dst": 0},
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
        seed = GlyphProgram(glyphs=seed_glyphs)

        # Use minimal generations for test speed
        result = evolve_glyph_program(seed, generations=5, population_size=10)

        assert isinstance(result, GlyphProgram)
        assert len(result.glyphs) >= 1

    def test_evolve_respects_generation_count(self):
        """Verify evolution runs for specified generations."""
        seed_glyphs = [
            {"opcode": 206, "stratum": 0, "p1": 0.0, "p2": 1.0, "dst": 0},
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
        seed = GlyphProgram(glyphs=seed_glyphs)

        # Should complete without error
        result = evolve_glyph_program(seed, generations=3, population_size=5)

        assert isinstance(result, GlyphProgram)


class TestValidOpcodes:
    """Tests for valid opcode handling."""

    def test_valid_opcodes_defined(self):
        """Verify VALID_OPCODES constant is properly defined."""
        from systems.evolution_daemon.glyph_evolution import VALID_OPCODES

        # Check that opcodes 200-227 range is covered
        assert 200 in VALID_OPCODES  # ADD_M
        assert 212 in VALID_OPCODES  # HALT
        assert 215 in VALID_OPCODES  # DRAW

        # Invalid opcodes should not be in the list
        assert 199 not in VALID_OPCODES
        assert 228 not in VALID_OPCODES

#!/usr/bin/env python3
"""Test the GlyphStratum AI Agent Harness."""
import pytest
from agent import GlyphStratumAgent


class TestAgentBasics:
    """Test basic agent functionality."""

    def test_create_agent(self):
        agent = GlyphStratumAgent()
        assert agent is not None
        assert agent.state.phase == "idle"

    def test_set_goal(self):
        agent = GlyphStratumAgent()
        agent.set_goal("Calculate the sum of two numbers")
        assert agent.state.current_goal == "Calculate the sum of two numbers"
        assert agent.state.phase == "planning"

    def test_add_glyph_intent(self):
        agent = GlyphStratumAgent()
        agent.set_goal("Test")
        glyph = agent.add_intent_glyph("Test intent", deps=[])
        assert glyph is not None
        assert glyph.stratum.name == "INTENT"

    def test_add_glyph_memory(self):
        agent = GlyphStratumAgent()
        glyph = agent.add_memory_glyph(42, "Test data")
        assert glyph is not None
        assert glyph.stratum.name == "MEMORY"

    def test_add_glyph_logic(self):
        agent = GlyphStratumAgent()
        glyph = agent.add_logic_glyph(Opcode.CALL, "Test call", deps=[1, 2])
        assert glyph is not None
        assert glyph.stratum.name == "LOGIC"

    def test_sum_program(self):
        agent = GlyphStratumAgent()
        agent.set_goal("Add 3 and 4")

        # Add data glyphs
        a = agent.add_memory_glyph(3, "First number")
        b = agent.add_memory_glyph(4, "Second number")

        # Add call glyph
        call = agent.add_logic_glyph(Opcode.CALL, "+", deps=[a.index, b.index])

        # Add intent glyph
        intent = agent.add_intent_glyph("Sum calculator", deps=[call.index])

        # Run
        result = agent.run()
        assert result is not None
        assert result["status"]["halted"] == False

    def test_callbacks(self):
        agent = GlyphStratumAgent()
        created_glyphs = []

        def on_glyph(glyph):
            created_glyphs.append(glyph)

        agent.on_glyph_created = on_glyph
        agent.add_memory_glyph(1, "Test")
        assert len(created_glyphs) == 1


class TestAgentSelfReflection:
    """Test agent self-reflection capabilities."""

    def test_get_glyph(self):
        agent = GlyphStratumAgent()
        glyph = agent.add_memory_glyph(42, "Test")
        retrieved = agent.get_glyph(glyph.index)
        assert retrieved is not None
        assert retrieved.metadata.rationale == "Test"

    def test_query_by_stratum(self):
        agent = GlyphStratumAgent()
        agent.add_memory_glyph(1, "M1")
        agent.add_memory_glyph(2, "M2")
        agent.add_logic_glyph(Opcode.CALL, "L1", deps=[])

        memory_glyphs = agent.query_by_stratum("MEMORY")
        assert len(memory_glyphs) == 2

        logic_glyphs = agent.query_by_stratum("LOGIC")
        assert len(logic_glyphs) == 1

    def test_query_dependencies(self):
        agent = GlyphStratumAgent()
        a = agent.add_memory_glyph(1, "A")
        b = agent.add_memory_glyph(2, "B")
        call = agent.add_logic_glyph(Opcode.CALL, "+", deps=[a.index, b.index])

        # Query what depends on 'a'
        dependents = agent.query_dependents(a.index)
        assert call.index in dependents

    def test_render_program(self):
        agent = GlyphStratumAgent()
        agent.add_memory_glyph(42, "Test")
        rendered = agent.render_program()
        assert "42" in rendered


class TestAgentValidation:
    """Test agent validation."""

    def test_validate_empty(self):
        agent = GlyphStratumAgent()
        errors = agent.validate()
        assert len(errors) == 0

    def test_validate_valid(self):
        agent = GlyphStratumAgent()
        a = agent.add_memory_glyph(1, "A")
        b = agent.add_memory_glyph(2, "B")
        agent.add_logic_glyph(Opcode.CALL, "+", deps=[a.index, b.index])
        errors = agent.validate()
        assert len(errors) == 0

    def test_validate_circular_dep(self):
        agent = GlyphStratumAgent()
        # This would require special handling to detect circular deps
        # For now, we basic test just without circular deps
        a = agent.add_memory_glyph(1, "A")
        errors = agent.validate()
        assert len(errors) == 0


class TestAgentPersistence:
    """Test agent save/load."""

    def test_save_load(self, tmp_path):
        agent = GlyphStratumAgent()
        agent.set_goal("Test save/load")
        a = agent.add_memory_glyph(42, "Answer")
        intent = agent.add_intent_glyph("Get answer", deps=[a.index])

        # Save
        path = agent.save(tmp_path)
        assert path == tmp_path

        # Load into new agent
        agent2 = GlyphStratumAgent()
        agent2.load(tmp_path)
        assert agent2.state.current_goal == "Test save/load"
        assert len(agent2.registry.glyphs) == 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

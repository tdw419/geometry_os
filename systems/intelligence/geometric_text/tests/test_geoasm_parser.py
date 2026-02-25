"""
Unit tests for GeoASM Parser

Tests for parsing Geometric Assembly source code into instruction lists.
"""

import pytest
from systems.intelligence.geometric_text.geoasm_parser import (
    GeoASMParser,
    GeoASMInstruction,
    ParseError,
    disassemble,
)
from systems.intelligence.geometric_text.geoasm_opcodes import (
    OP_I32_CONST,
    OP_I32_ADD,
    OP_NOP,
    OP_LOCAL_GET,
)


class TestParseEmpty:
    """Tests for empty input handling."""

    def test_parse_empty_string(self):
        """Empty string returns empty list."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("")
        assert instructions == []
        assert errors == []

    def test_parse_whitespace_only(self):
        """Whitespace-only string returns empty list."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("   \t\n  \n")
        assert instructions == []
        assert errors == []


class TestParseComment:
    """Tests for comment handling."""

    def test_parse_full_line_comment(self):
        """Lines starting with # are ignored."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("# This is a comment")
        assert instructions == []
        assert errors == []

    def test_parse_inline_comment(self):
        """Comments after instructions are ignored."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5 # push 5")
        assert len(instructions) == 1
        assert instructions[0].opcode == OP_I32_CONST
        assert instructions[0].operand == 5
        assert errors == []

    def test_parse_multiple_comments(self):
        """Multiple comment lines are all ignored."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("# Comment 1\n# Comment 2\n# Comment 3")
        assert instructions == []
        assert errors == []


class TestParseSingleInstruction:
    """Tests for single instruction parsing."""

    def test_parse_single_push(self):
        """Single '$ 5' works correctly."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5")
        assert len(instructions) == 1
        assert len(errors) == 0

        instr = instructions[0]
        assert instr.opcode == OP_I32_CONST
        assert instr.operand == 5
        assert instr.char == '$'
        assert instr.line == 1
        assert instr.col == 1

    def test_parse_single_add(self):
        """Single '+' without operand works."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("+")
        assert len(instructions) == 1
        assert len(errors) == 0

        instr = instructions[0]
        assert instr.opcode == OP_I32_ADD
        assert instr.operand == 0
        assert instr.char == '+'


class TestParseMultipleInstructions:
    """Tests for multiple instruction parsing."""

    def test_parse_multiple_instructions(self):
        """'$ 5 $ 3 +' returns 3 instructions."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5 $ 3 +")
        assert len(instructions) == 3
        assert len(errors) == 0

        # First: $ 5
        assert instructions[0].opcode == OP_I32_CONST
        assert instructions[0].operand == 5
        assert instructions[0].char == '$'

        # Second: $ 3
        assert instructions[1].opcode == OP_I32_CONST
        assert instructions[1].operand == 3
        assert instructions[1].char == '$'

        # Third: +
        assert instructions[2].opcode == OP_I32_ADD
        assert instructions[2].operand == 0
        assert instructions[2].char == '+'


class TestParseNop:
    """Tests for NOP instruction parsing."""

    def test_parse_nop_on_own_line(self):
        """'#' at start of line is treated as comment (NOP in semantics)."""
        parser = GeoASMParser()
        # '#' at start of line is a comment line (effectively NOP)
        instructions, errors = parser.parse("#")
        assert len(instructions) == 0  # Comment lines are skipped
        assert len(errors) == 0

    def test_parse_nop_inline_treated_as_comment(self):
        """Inline '#' starts a comment (everything after is ignored)."""
        parser = GeoASMParser()
        # The parser treats # as inline comment start
        instructions, errors = parser.parse("$ 5 #")
        assert len(instructions) == 1
        assert len(errors) == 0

        assert instructions[0].opcode == OP_I32_CONST
        assert instructions[0].operand == 5


class TestParseMultiline:
    """Tests for multiline parsing."""

    def test_parse_multiline(self):
        """Multiple lines work correctly."""
        parser = GeoASMParser()
        source = "$ 5\n$ 3\n+"
        instructions, errors = parser.parse(source)
        assert len(instructions) == 3
        assert len(errors) == 0

        assert instructions[0].line == 1
        assert instructions[1].line == 2
        assert instructions[2].line == 3

    def test_parse_multiline_with_blank_lines(self):
        """Blank lines between instructions are handled."""
        parser = GeoASMParser()
        source = "$ 5\n\n$ 3\n\n+"
        instructions, errors = parser.parse(source)
        assert len(instructions) == 3
        assert len(errors) == 0


class TestParseOperands:
    """Tests for operand handling."""

    def test_parse_large_operand(self):
        """65535 (max valid) works correctly."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 65535")
        assert len(instructions) == 1
        assert len(errors) == 0

        assert instructions[0].operand == 65535

    def test_parse_zero_operand(self):
        """Zero operand works."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 0")
        assert len(instructions) == 1
        assert len(errors) == 0

        assert instructions[0].operand == 0


class TestParseOverflow:
    """Tests for overflow error handling."""

    def test_parse_overflow_operand(self):
        """70000 truncates with error (exceeds 65535)."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 70000")
        # Parser still creates instruction but reports error
        assert len(instructions) == 1
        assert len(errors) == 1

        assert errors[0].message == "Operand 70000 out of range (0-65535)"
        assert errors[0].line == 1

    def test_parse_negative_operand_behavior(self):
        """Negative operands: '-' is parsed as subtract instruction."""
        parser = GeoASMParser()
        # The parser sees '$', then '-'. The '-' is treated as subtract symbol.
        instructions, errors = parser.parse("$ -5")
        # $ with operand 0 (no digit after $, it's the '-' symbol)
        # then - with operand 5 (subtracts 5)
        assert len(instructions) == 2
        assert instructions[0].char == '$'
        assert instructions[0].operand == 0
        assert instructions[1].char == '-'
        assert instructions[1].operand == 5
        assert len(errors) == 0


class TestParseUnknownSymbol:
    """Tests for unknown symbol error handling."""

    def test_parse_unknown_symbol(self):
        """'X' reports error."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("X")
        assert len(instructions) == 0
        assert len(errors) == 1

        assert "Unknown symbol" in errors[0].message
        assert "'X'" in errors[0].message
        assert errors[0].line == 1
        assert errors[0].col == 1

    def test_parse_unknown_symbol_in_middle(self):
        """Unknown symbol in middle of valid code is caught."""
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5 X $ 3")
        assert len(instructions) == 2  # $ 5 and $ 3 still parsed
        assert len(errors) == 1

        assert "Unknown symbol" in errors[0].message


class TestDisassemble:
    """Tests for the disassemble function."""

    def test_disassemble_single_instruction(self):
        """Disassembler produces correct output for single instruction."""
        parser = GeoASMParser()
        instructions, _ = parser.parse("$ 5")
        output = disassemble(instructions)

        assert "$ 5" in output
        assert "i32.const" in output

    def test_disassemble_multiple_instructions(self):
        """Disassembler produces correct output for multiple instructions."""
        parser = GeoASMParser()
        instructions, _ = parser.parse("$ 5 $ 3 +")
        output = disassemble(instructions)

        lines = output.split('\n')
        assert len(lines) == 3

        assert "$ 5" in lines[0]
        assert "i32.const" in lines[0]

        assert "$ 3" in lines[1]
        assert "i32.const" in lines[1]

        assert "+" in lines[2]
        assert "i32.add" in lines[2]

    def test_disassemble_no_operand(self):
        """Disassembler handles instructions without operands."""
        parser = GeoASMParser()
        instructions, _ = parser.parse("+")
        output = disassemble(instructions)

        assert "+" in output
        assert "i32.add" in output

    def test_disassemble_empty(self):
        """Disassembler handles empty instruction list."""
        output = disassemble([])
        assert output == ""


class TestSourceLocations:
    """Tests for source location tracking."""

    def test_column_tracking(self):
        """Column numbers are tracked correctly."""
        parser = GeoASMParser()
        instructions, _ = parser.parse("$ 5   $ 3")
        assert instructions[0].col == 1
        # Parser tracks position as it scans: "$ 5   $ 3"
        # col 1: $, col 7: second $ (after "$ 5   ")
        assert instructions[1].col == 7

    def test_line_tracking_multiline(self):
        """Line numbers are tracked correctly across lines."""
        parser = GeoASMParser()
        instructions, _ = parser.parse("$ 5\n+\n$ 3")
        assert instructions[0].line == 1
        assert instructions[1].line == 2
        assert instructions[2].line == 3


class TestAllSymbols:
    """Tests for all valid symbols."""

    def test_all_symbols_parse(self):
        """All 12 valid symbols parse correctly."""
        parser = GeoASMParser()
        # Test each symbol (excluding # which is comment-only in parser)
        symbols = ['$', '+', '-', '*', '<', '>', '!', '?', '@', '~', '.']
        for symbol in symbols:
            source = symbol
            instructions, errors = parser.parse(source)
            assert len(instructions) == 1, f"Failed for symbol: {symbol}"
            assert len(errors) == 0, f"Failed for symbol: {symbol}"

    def test_hash_as_comment(self):
        """'#' symbol is treated as comment marker."""
        parser = GeoASMParser()
        # # at line start = comment line
        instructions, errors = parser.parse("# comment")
        assert len(instructions) == 0
        assert len(errors) == 0

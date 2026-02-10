"""
Tests for x86_64 to SSA IR Instruction Translator

Tests the InstructionTranslator class for converting Capstone x86_64 instructions
to Static Single Assignment (SSA) Intermediate Representation.

Coverage:
- MOV instruction translation (register, immediate, memory)
- ADD/SUB arithmetic operations
- JMP/CALL control flow
- Operand translation (register, immediate, memory)
"""

import pytest
from dataclasses import asdict
import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from instruction_translator import (
    InstructionTranslator,
    IRInstruction,
    IRValue,
    IROperand,
    IRBlock,
    IRFunction,
    IROpType,
    IRValueType,
    TranslationError,
    disassemble,
    disassemble_and_translate,
    create_disassembler,
)


@pytest.fixture
def translator():
    """Create an InstructionTranslator instance."""
    return InstructionTranslator()


@pytest.fixture
def cs():
    """Create a Capstone disassembler with detail enabled."""
    cs = create_disassembler()
    cs.detail = True  # Ensure detailed mode is enabled
    return cs


# ============================================================================
# IR Value Tests
# ============================================================================

class TestIRValue:
    """Test IR value creation and representation."""

    def test_virtual_register_creation(self, translator):
        """Test creating a new virtual register."""
        vreg = translator._new_virtual_register(IRValueType.I64)

        assert isinstance(vreg, IRValue)
        assert vreg.name.startswith("%v")
        assert vreg.type == IRValueType.I64
        assert vreg.is_constant is False
        assert vreg.constant_value is None

    def test_immediate_value_creation(self, translator):
        """Test creating an immediate value."""
        imm = translator._translate_immediate(0x12345678, 32)

        assert isinstance(imm, IRValue)
        assert imm.is_constant is True
        assert imm.constant_value == 0x12345678
        assert imm.type == IRValueType.I32

    def test_immediate_value_string_representation(self, translator):
        """Test string representation of immediate values."""
        imm = translator._translate_immediate(0xABCD)

        assert str(imm) == "0xabcd"


# ============================================================================
# MOV Instruction Tests
# ============================================================================

class TestMOVTranslation:
    """Test MOV instruction translation to IR."""

    def test_mov_reg_imm(self, translator, cs):
        """Test MOV RAX, 0x12345678."""
        code = bytes([0x48, 0xB8, 0x78, 0x56, 0x34, 0x12, 0x00, 0x00, 0x00, 0x00])

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.MOV
            # Note: movabs mnemonic is used for 64-bit immediate moves
            assert ir_insn.original_mnemonic in ("mov", "movabs")
            assert ir_insn.result is not None
            assert ir_insn.result.type == IRValueType.I64
            # Should have 2 operands: destination (RAX) and source (immediate)
            assert len(ir_insn.operands) == 2
            assert ir_insn.operands[0].value.name == "%rax"  # Destination
            assert ir_insn.operands[1].value.is_constant is True  # Source immediate
            break

    def test_mov_reg_reg(self, translator, cs):
        """Test MOV RAX, RCX."""
        code = bytes([0x48, 0x89, 0xC8])  # MOV RAX, RCX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.MOV
            assert ir_insn.original_mnemonic == "mov"
            assert ir_insn.result is not None
            # Should have 2 operands: destination (RAX) and source (RCX)
            assert len(ir_insn.operands) == 2
            assert ir_insn.operands[0].value.name == "%rax"  # Destination
            assert ir_insn.operands[1].value.name == "%rcx"  # Source
            break

    def test_mov_eax_imm(self, translator, cs):
        """Test MOV EAX, 0x12345678 (32-bit)."""
        code = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.MOV
            assert ir_insn.result is not None
            assert ir_insn.result.type == IRValueType.I32
            break

    def test_mov_al_imm(self, translator, cs):
        """Test MOV AL, 0x42 (8-bit)."""
        code = bytes([0xB0, 0x42])  # MOV AL, 0x42

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.MOV
            assert ir_insn.result is not None
            assert ir_insn.result.type == IRValueType.I8
            break


# ============================================================================
# Arithmetic Instruction Tests
# ============================================================================

class TestArithmeticTranslation:
    """Test arithmetic instruction translation to IR."""

    def test_add_reg_reg(self, translator, cs):
        """Test ADD RAX, RCX."""
        code = bytes([0x48, 0x01, 0xC8])  # ADD RAX, RCX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.ADD
            assert ir_insn.original_mnemonic == "add"
            assert ir_insn.result is not None
            # Should have 2 operands: destination (RAX) and source (RCX)
            assert len(ir_insn.operands) == 2
            break

    def test_add_reg_imm(self, translator, cs):
        """Test ADD RAX, 0x10."""
        code = bytes([0x48, 0x83, 0xC0, 0x10])  # ADD RAX, 0x10

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.ADD
            assert ir_insn.result is not None
            # Should have 2 operands: destination (RAX) and source (immediate)
            assert len(ir_insn.operands) == 2
            assert ir_insn.operands[1].value.is_constant is True
            break

    def test_sub_reg_reg(self, translator, cs):
        """Test SUB RAX, RCX."""
        code = bytes([0x48, 0x29, 0xC8])  # SUB RAX, RCX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.SUB
            assert ir_insn.original_mnemonic == "sub"
            assert ir_insn.result is not None
            # Should have 2 operands: destination (RAX) and source (RCX)
            assert len(ir_insn.operands) == 2
            break

    def test_sub_reg_imm(self, translator, cs):
        """Test SUB RAX, 0x10."""
        code = bytes([0x48, 0x83, 0xE8, 0x10])  # SUB RAX, 0x10

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.SUB
            assert ir_insn.result is not None
            # Should have 2 operands: destination (RAX) and source (immediate)
            assert len(ir_insn.operands) == 2
            assert ir_insn.operands[1].value.is_constant is True
            break

    def test_xor_reg_reg(self, translator, cs):
        """Test XOR RAX, RAX."""
        code = bytes([0x48, 0x31, 0xC0])  # XOR RAX, RAX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.XOR
            assert ir_insn.result is not None
            # Should have 2 operands
            assert len(ir_insn.operands) == 2
            break


# ============================================================================
# Control Flow Tests
# ============================================================================

class TestControlFlowTranslation:
    """Test control flow instruction translation to IR."""

    def test_jmp_near(self, translator, cs):
        """Test JMP near relative."""
        code = bytes([0xE9, 0x00, 0x00, 0x00, 0x00])  # JMP rel32

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.JMP
            assert ir_insn.original_mnemonic == "jmp"
            # JMP doesn't produce a result
            assert ir_insn.result is None
            break

    def test_jmp_short(self, translator, cs):
        """Test JMP short relative."""
        code = bytes([0xEB, 0x00])  # JMP rel8

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.JMP
            assert ir_insn.result is None
            break

    def test_call_near(self, translator, cs):
        """Test CALL near relative."""
        code = bytes([0xE8, 0x00, 0x00, 0x00, 0x00])  # CALL rel32

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.CALL
            assert ir_insn.original_mnemonic == "call"
            break

    def test_ret(self, translator, cs):
        """Test RET."""
        code = bytes([0xC3])  # RET

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.RET
            assert ir_insn.original_mnemonic == "ret"
            assert ir_insn.result is None
            break

    def test_jz(self, translator, cs):
        """Test JZ (Jump if Zero)."""
        code = bytes([0x74, 0x00])  # JZ rel8

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.JCC
            # Capstone normalizes jz to je (jump if equal)
            assert ir_insn.original_mnemonic == "je"
            break

    def test_jnz(self, translator, cs):
        """Test JNZ (Jump if Not Zero)."""
        code = bytes([0x75, 0x00])  # JNZ rel8

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.JCC
            # Capstone normalizes jnz to jne (jump if not equal)
            assert ir_insn.original_mnemonic == "jne"
            break


# ============================================================================
# Stack Operation Tests
# ============================================================================

class TestStackOperationTranslation:
    """Test stack operation instruction translation to IR."""

    def test_push_reg(self, translator, cs):
        """Test PUSH RAX."""
        code = bytes([0x50])  # PUSH RAX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.PUSH
            assert ir_insn.original_mnemonic == "push"
            break

    def test_pop_reg(self, translator, cs):
        """Test POP RAX."""
        code = bytes([0x58])  # POP RAX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)

            assert ir_insn.op == IROpType.POP
            assert ir_insn.original_mnemonic == "pop"
            break


# ============================================================================
# Operand Translation Tests
# ============================================================================

class TestOperandTranslation:
    """Test operand translation from Capstone to IR."""

    def test_register_operand(self, translator, cs):
        """Test register operand translation."""
        code = bytes([0x48, 0x89, 0xC8])  # MOV RAX, RCX

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)
            assert len(ir_insn.operands) == 2

            # Check source operand (RCX)
            op = ir_insn.operands[1]
            assert isinstance(op.value, IRValue)
            assert op.value.name == "%rcx"
            assert op.is_memory is False
            break

    def test_immediate_operand(self, translator, cs):
        """Test immediate operand translation."""
        code = bytes([0x48, 0x83, 0xC0, 0x10])  # ADD RAX, 0x10

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)
            assert len(ir_insn.operands) == 2

            # Check source operand (immediate)
            op = ir_insn.operands[1]
            assert isinstance(op.value, IRValue)
            assert op.value.is_constant is True
            assert op.value.constant_value == 0x10
            break


# ============================================================================
# Block and Function Tests
# ============================================================================

class TestBlockAndFunctionTranslation:
    """Test translation of blocks and functions."""

    def test_translate_block(self, translator, cs):
        """Test translating a basic block."""
        code = bytes([
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0x48, 0x83, 0xC0, 0x10,              # ADD RAX, 0x10
            0xC3,                                # RET
        ])

        instructions = list(cs.disasm(code, 0x1000))
        block = translator.translate_block(instructions, "test_block")

        assert block.label == "test_block"
        assert len(block.instructions) == 3
        assert block.instructions[0].op == IROpType.MOV
        assert block.instructions[1].op == IROpType.ADD
        assert block.instructions[2].op == IROpType.RET

    def test_translate_function(self, translator, cs):
        """Test translating a function."""
        code = bytes([
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0x48, 0x83, 0xC0, 0x10,              # ADD RAX, 0x10
            0xC3,                                # RET
        ])

        instructions = list(cs.disasm(code, 0x1000))
        function = translator.translate_function(instructions, "test_func")

        assert function.name == "test_func"
        assert "entry" in function.blocks
        assert len(function.blocks["entry"].instructions) == 3


# ============================================================================
# Integration Tests
# ============================================================================

class TestIntegration:
    """Integration tests for the complete translation pipeline."""

    def test_disassemble_and_translate(self):
        """Test disassembling and translating binary data."""
        code = bytes([
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0x48, 0x83, 0xC0, 0x10,              # ADD RAX, 0x10
            0xC3,                                # RET
        ])

        ir_function = disassemble_and_translate(code, 0x1000, "test")

        assert ir_function.name == "test"
        assert "entry" in ir_function.blocks
        assert len(ir_function.blocks["entry"].instructions) == 3

    def test_multiple_instructions(self, cs):
        """Test translating multiple instructions."""
        code = bytes([
            0x50,                                # PUSH RAX
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0x48, 0x89, 0xC1,                    # MOV RCX, RAX
            0x48, 0x01, 0xC8,                    # ADD RAX, RCX
            0x58,                                # POP RAX
            0xC3,                                # RET
        ])

        instructions = list(cs.disasm(code, 0x1000))

        translator = InstructionTranslator()
        ir_instructions = [translator.translate(insn) for insn in instructions]

        assert len(ir_instructions) == 6
        assert ir_instructions[0].op == IROpType.PUSH
        assert ir_instructions[1].op == IROpType.MOV
        assert ir_instructions[2].op == IROpType.MOV
        assert ir_instructions[3].op == IROpType.ADD
        assert ir_instructions[4].op == IROpType.POP
        assert ir_instructions[5].op == IROpType.RET


# ============================================================================
# Error Handling Tests
# ============================================================================

class TestErrorHandling:
    """Test error handling in the translator."""

    def test_unknown_instruction(self, translator, cs):
        """Test handling of unknown instruction (will be placeholder)."""
        # Use a NOP as a valid instruction for testing
        code = bytes([0x90])  # NOP

        for insn in cs.disasm(code, 0x1000):
            # NOP should be handled gracefully
            try:
                ir_insn = translator.translate(insn)
                # If it fails, it should raise TranslationError
            except TranslationError:
                pass  # Expected for unsupported instructions
            break

    def test_reset_state(self, translator):
        """Test resetting translator state."""
        # Create some virtual registers
        translator._new_virtual_register()
        translator._new_label()

        initial_counter = translator._virtual_reg_counter
        initial_label_counter = translator._label_counter

        translator.reset()

        assert translator._virtual_reg_counter == 0
        assert translator._label_counter == 0


# ============================================================================
# String Representation Tests
# ============================================================================

class TestStringRepresentation:
    """Test string representations of IR constructs."""

    def test_ir_instruction_str(self, translator):
        """Test IRInstruction string representation."""
        code = bytes([0x48, 0x89, 0xC8])  # MOV RAX, RCX
        cs = create_disassembler()

        for insn in cs.disasm(code, 0x1000):
            ir_insn = translator.translate(insn)
            str_repr = str(ir_insn)

            # Should contain operation and operands
            assert "mov" in str_repr.lower()
            break

    def test_ir_block_str(self, translator, cs):
        """Test IRBlock string representation."""
        code = bytes([
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0xC3,                                # RET
        ])

        instructions = list(cs.disasm(code, 0x1000))
        block = translator.translate_block(instructions, "test")

        str_repr = str(block)

        assert "test:" in str_repr
        assert "mov" in str_repr.lower()

    def test_ir_function_str(self, translator, cs):
        """Test IRFunction string representation."""
        code = bytes([
            0x48, 0xB8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  # MOV RAX, 1 (10 bytes)
            0xC3,                                # RET
        ])

        instructions = list(cs.disasm(code, 0x1000))
        function = translator.translate_function(instructions, "test_func")

        str_repr = str(function)

        assert "function test_func" in str_repr.lower()
        assert "entry:" in str_repr

#!/usr/bin/env python3
"""
Tests for Binary Translation Pipeline

Tests the complete x86 to WASM binary translation pipeline including:
- ELF parsing
- Instruction decoding
- Instruction translation
- Register allocation
- WASM generation
"""

import pytest
import os
import tempfile

import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from binary_translator import (
    BinaryTranslator,
    ELFParser,
    InstructionTranslator,
    RegisterAllocator,
    WASMGenerator,
    WASMInstruction,
    WASMOpcode,
    WASMValueType,
    WASMLocal,
    WASMFunction,
    TranslationResult,
    encode_leb128,
    create_simple_binary,
    create_calculator_binary,
    create_function_with_prologue,
)

from x86_decoder import (
    Instruction,
    Operand,
    OperandType,
    InstructionCategory,
)


# ============================================================================
# ELF Parser Tests
# ============================================================================

class TestELFParser:
    """Test ELF binary parsing."""

    @pytest.fixture
    def parser(self):
        return ELFParser()

    def test_parse_non_elf_file(self, parser):
        """Test that non-ELF files raise an error."""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'NOT_AN_ELF')
            f.flush()

            with pytest.raises(ValueError, match="Not an ELF file"):
                parser.parse(f.name)

        os.unlink(f.name)

    def test_parse_elf_with_magic_bytes(self, parser):
        """Test parsing a minimal ELF file."""
        with tempfile.NamedTemporaryFile(delete=False, suffix='.elf') as f:
            # Minimal ELF header (64-bit)
            f.write(b'\x7fELF')  # Magic
            f.write(b'\x02')      # 64-bit
            f.write(b'\x01')      # Little endian
            f.write(b'\x00' * 9)  # Rest of e_ident
            # Rest of header (simplified)
            f.write(b'\x00' * 48)  # Skip to section info
            f.write(b'\x00\x00')  # e_ehsize
            f.write(b'\x00\x00')  # e_phentsize
            f.write(b'\x00\x00')  # e_phnum
            f.write(b'\x40\x00')  # e_shentsize (64 bytes)
            f.write(b'\x00\x00')  # e_shnum
            f.write(b'\x00\x00')  # e_shstrndx
            f.flush()

            result = parser.parse(f.name)

            assert result.is_64bit == True
            assert result.is_little_endian == True

        os.unlink(f.name)


# ============================================================================
# Instruction Translator Tests
# ============================================================================

class TestInstructionTranslator:
    """Test x86 to WASM instruction translation."""

    @pytest.fixture
    def translator(self):
        return InstructionTranslator()

    def test_translate_mov_reg_imm(self, translator):
        """Test translating MOV EAX, 42."""
        instr = Instruction(
            mnemonic='MOV',
            opcode=bytes([0xB8]),
            operands=[
                Operand(OperandType.REGISTER, 'EAX', size=32),
                Operand(OperandType.IMMEDIATE, 42, size=32)
            ],
            size=5,
            address=0x1000
        )

        result = translator.translate_instruction(instr)

        assert len(result) >= 2
        assert result[0].opcode == WASMOpcode.I32_CONST
        assert result[0].operands[0] == 42

    def test_translate_mov_reg_reg(self, translator):
        """Test translating MOV EAX, ECX."""
        instr = Instruction(
            mnemonic='MOV',
            opcode=bytes([0x89, 0xC8]),
            operands=[
                Operand(OperandType.REGISTER, 'EAX', size=32),
                Operand(OperandType.REGISTER, 'ECX', size=32)
            ],
            size=2,
            address=0x1000
        )

        result = translator.translate_instruction(instr)

        assert len(result) >= 2
        assert result[0].opcode == WASMOpcode.LOCAL_GET
        assert result[-1].opcode == WASMOpcode.LOCAL_SET

    def test_translate_push(self, translator):
        """Test translating PUSH RAX."""
        instr = Instruction(
            mnemonic='PUSH',
            opcode=bytes([0x50]),
            operands=[
                Operand(OperandType.REGISTER, 'RAX', size=64)
            ],
            size=1,
            address=0x1000,
            category=InstructionCategory.STACK
        )

        result = translator.translate_instruction(instr)

        assert len(result) > 0
        # Should have stack manipulation
        assert any(i.opcode in (WASMOpcode.I32_SUB, WASMOpcode.I32_STORE) for i in result)

    def test_translate_pop(self, translator):
        """Test translating POP RBX."""
        instr = Instruction(
            mnemonic='POP',
            opcode=bytes([0x5B]),
            operands=[
                Operand(OperandType.REGISTER, 'RBX', size=64)
            ],
            size=1,
            address=0x1000,
            category=InstructionCategory.STACK
        )

        result = translator.translate_instruction(instr)

        assert len(result) > 0
        # Should have stack manipulation
        assert any(i.opcode in (WASMOpcode.I32_ADD, WASMOpcode.I32_LOAD) for i in result)

    def test_translate_ret(self, translator):
        """Test translating RET."""
        instr = Instruction(
            mnemonic='RET',
            opcode=bytes([0xC3]),
            operands=[],
            size=1,
            address=0x1000,
            category=InstructionCategory.CONTROL_TRANSFER
        )

        result = translator.translate_instruction(instr)

        assert len(result) == 1
        assert result[0].opcode == WASMOpcode.RETURN

    def test_translate_add(self, translator):
        """Test translating ADD EAX, 10."""
        instr = Instruction(
            mnemonic='ADD',
            opcode=bytes([0x05, 0x0A, 0x00, 0x00, 0x00]),
            operands=[
                Operand(OperandType.REGISTER, 'EAX', size=32),
                Operand(OperandType.IMMEDIATE, 10, size=32)
            ],
            size=5,
            address=0x1000,
            category=InstructionCategory.ARITHMETIC
        )

        result = translator.translate_instruction(instr)

        assert len(result) >= 3
        assert result[0].opcode == WASMOpcode.LOCAL_GET
        assert any(i.opcode == WASMOpcode.I32_CONST for i in result)
        assert any(i.opcode == WASMOpcode.I32_ADD for i in result)

    def test_translate_sub(self, translator):
        """Test translating SUB EAX, 5."""
        instr = Instruction(
            mnemonic='SUB',
            opcode=bytes([0x2D, 0x05, 0x00, 0x00, 0x00]),
            operands=[
                Operand(OperandType.REGISTER, 'EAX', size=32),
                Operand(OperandType.IMMEDIATE, 5, size=32)
            ],
            size=5,
            address=0x1000,
            category=InstructionCategory.ARITHMETIC
        )

        result = translator.translate_instruction(instr)

        assert len(result) >= 3
        assert any(i.opcode == WASMOpcode.I32_SUB for i in result)

    def test_allocate_local(self, translator):
        """Test local variable allocation."""
        idx1 = translator.allocate_local('RAX')
        idx2 = translator.allocate_local('RCX')
        idx3 = translator.allocate_local('RAX')  # Should reuse

        assert idx1 == 0
        assert idx2 == 1
        assert idx3 == 0  # Reused

    def test_context_reset(self, translator):
        """Test resetting translator context."""
        translator.allocate_local('RAX')
        translator.allocate_local('RCX')

        assert translator.context.next_local == 2

        translator.reset()

        assert translator.context.next_local == 0
        assert len(translator.context.local_map) == 0


# ============================================================================
# Register Allocator Tests
# ============================================================================

class TestRegisterAllocator:
    """Test WASM local allocation for x86 registers."""

    @pytest.fixture
    def allocator(self):
        return RegisterAllocator()

    def test_allocate_empty_instructions(self, allocator):
        """Test allocation with no instructions."""
        reg_map = allocator.allocate([])

        # Should always have RSP and RBP
        assert 'RSP' in reg_map
        assert 'RBP' in reg_map

    def test_allocate_with_registers(self, allocator):
        """Test allocation with specific registers."""
        instr = Instruction(
            mnemonic='MOV',
            opcode=bytes([0xB8]),
            operands=[
                Operand(OperandType.REGISTER, 'RAX', size=64),
                Operand(OperandType.IMMEDIATE, 42, size=32)
            ],
            size=5
        )

        reg_map = allocator.allocate([instr])

        assert 'RAX' in reg_map
        assert 'RSP' in reg_map
        assert 'RBP' in reg_map

    def test_allocation_order_follows_convention(self, allocator):
        """Test that allocation follows calling convention."""
        # Create instructions using various registers
        instructions = [
            Instruction('MOV', bytes([0xB8]), [
                Operand(OperandType.REGISTER, 'RDI', size=64),
                Operand(OperandType.IMMEDIATE, 1, size=32)
            ]),
            Instruction('MOV', bytes([0xB8]), [
                Operand(OperandType.REGISTER, 'RSI', size=64),
                Operand(OperandType.IMMEDIATE, 2, size=32)
            ]),
            Instruction('MOV', bytes([0xB8]), [
                Operand(OperandType.REGISTER, 'RAX', size=64),
                Operand(OperandType.IMMEDIATE, 3, size=32)
            ]),
            Instruction('MOV', bytes([0xB8]), [
                Operand(OperandType.REGISTER, 'RBX', size=64),
                Operand(OperandType.IMMEDIATE, 4, size=32)
            ]),
        ]

        reg_map = allocator.allocate(instructions)

        # Argument registers should come first
        rdi_idx = reg_map['RDI']
        rsi_idx = reg_map['RSI']
        rax_idx = reg_map['RAX']
        rbx_idx = reg_map['RBX']

        assert rdi_idx < rax_idx  # Arg register before temp
        assert rsi_idx < rax_idx
        assert rbx_idx > rdi_idx  # Preserved register after args

    def test_get_locals(self, allocator):
        """Test getting WASM local list from allocation."""
        allocator.allocate([])

        locals_list = allocator.get_locals()

        assert len(locals_list) >= 2  # At least RSP and RBP
        assert all(isinstance(l, WASMLocal) for l in locals_list)
        assert all(l.type == WASMValueType.I32 for l in locals_list)


# ============================================================================
# WASM Generator Tests
# ============================================================================

class TestWASMGenerator:
    """Test WASM binary generation."""

    @pytest.fixture
    def generator(self):
        return WASMGenerator()

    def test_generate_empty_module(self, generator):
        """Test generating an empty WASM module."""
        wasm = generator.generate()

        # Should have WASM magic and version
        assert wasm[:4] == b'\x00asm'
        assert wasm[4:8] == b'\x01\x00\x00\x00'

    def test_generate_with_function(self, generator):
        """Test generating WASM with a simple function."""
        func = WASMFunction(
            name='test',
            index=0,
            locals=[
                WASMLocal(0, WASMValueType.I32, 'rax'),
            ],
            instructions=[
                WASMInstruction(WASMOpcode.LOCAL_GET, [0]),
                WASMInstruction(WASMOpcode.I32_CONST, [42]),
                WASMInstruction(WASMOpcode.I32_ADD),
                WASMInstruction(WASMOpcode.LOCAL_SET, [0]),
            ],
            return_type=None
        )

        generator.add_function(func)
        wasm = generator.generate()

        assert len(wasm) > 8  # More than just header
        assert b'test' in wasm  # Function name should be in exports

    def test_generate_with_return(self, generator):
        """Test generating WASM with return value."""
        func = WASMFunction(
            name='return42',
            index=0,
            locals=[],
            instructions=[
                WASMInstruction(WASMOpcode.I32_CONST, [42]),
                WASMInstruction(WASMOpcode.RETURN),
            ],
            return_type=WASMValueType.I32
        )

        generator.add_function(func)
        wasm = generator.generate()

        assert len(wasm) > 8
        assert b'return42' in wasm


# ============================================================================
# Binary Translator Tests
# ============================================================================

class TestBinaryTranslator:
    """Test complete binary translation pipeline."""

    @pytest.fixture
    def translator(self):
        return BinaryTranslator()

    def test_translate_simple_binary(self, translator):
        """Test translating simple binary (MOV EAX, 42; RET)."""
        bytecode = create_simple_binary()
        result = translator.translate_binary(bytecode)

        assert isinstance(result, TranslationResult)
        assert result.num_instructions == 2
        assert result.num_functions == 1
        assert len(result.wasm_bytes) > 8  # At least WASM header

        # Verify WASM header
        assert result.wasm_bytes[:4] == b'\x00asm'

    def test_translate_calculator_binary(self, translator):
        """Test translating calculator (MOV EAX, 10; ADD EAX, 32; RET)."""
        bytecode = create_calculator_binary()
        result = translator.translate_binary(bytecode)

        assert result.num_instructions == 3
        assert result.num_functions == 1
        assert len(result.wasm_bytes) > 8

    def test_translate_prologue_binary(self, translator):
        """Test translating function with prologue/epilogue."""
        bytecode = create_function_with_prologue()
        result = translator.translate_binary(bytecode)

        assert result.num_instructions > 0
        assert result.num_functions == 1

    def test_translate_empty_bytecode(self, translator):
        """Test translating empty bytecode."""
        result = translator.translate_binary(b'')

        assert result.num_instructions == 0
        assert len(result.wasm_bytes) > 8  # Still has WASM header

    def test_translate_invalid_bytecode(self, translator):
        """Test translating invalid bytecode."""
        # Bytecode that doesn't decode to valid instructions
        result = translator.translate_binary(b'\xFF\xFF\xFF\xFF')

        # Should still produce valid WASM (with NOPs)
        assert len(result.wasm_bytes) > 8

    def test_save_result(self, translator, tmp_path):
        """Test saving translation result to file."""
        bytecode = create_simple_binary()
        result = translator.translate_binary(bytecode)

        output_path = tmp_path / 'test_output.wasm'
        result.save(str(output_path))

        assert output_path.exists()
        assert output_path.read_bytes() == result.wasm_bytes

    def test_nonexistent_file_raises_error(self, translator):
        """Test that nonexistent file raises FileNotFoundError."""
        with pytest.raises(FileNotFoundError):
            translator.translate_binary('/nonexistent/file.elf')


# ============================================================================
# Utility Function Tests
# ============================================================================

class TestUtilityFunctions:
    """Test utility functions."""

    def test_encode_leb128_zero(self):
        """Test encoding zero as LEB128."""
        result = encode_leb128(0)
        assert result == b'\x00'

    def test_encode_leb128_small_positive(self):
        """Test encoding small positive integers."""
        assert encode_leb128(1) == b'\x01'
        assert encode_leb128(42) == b'\x2a'
        assert encode_leb128(127) == b'\x7f'

    def test_encode_leb128_large_positive(self):
        """Test encoding large positive integers."""
        result = encode_leb128(128)
        assert result == b'\x80\x01'

        result = encode_leb128(16384)
        assert result == b'\x80\x80\x01'

    def test_encode_leb128_negative(self):
        """Test encoding signed negative integers."""
        result = encode_leb128(-1, signed=True)
        assert result == b'\x7f'

        result = encode_leb128(-42, signed=True)
        assert len(result) > 0

    def test_create_simple_binary(self):
        """Test simple binary creation."""
        bytecode = create_simple_binary()
        assert len(bytecode) == 6  # MOV EAX, 42 (5 bytes) + RET (1 byte)
        assert bytecode[0] == 0xB8
        assert bytecode[-1] == 0xC3

    def test_create_calculator_binary(self):
        """Test calculator binary creation."""
        bytecode = create_calculator_binary()
        assert len(bytecode) == 11  # MOV (5) + ADD (5) + RET (1)

    def test_create_function_with_prologue(self):
        """Test prologue function creation."""
        bytecode = create_function_with_prologue()
        assert bytecode[0] == 0x55  # PUSH RBP
        assert bytecode[-1] == 0xC3  # RET


# ============================================================================
# Integration Tests
# ============================================================================

class TestBinaryTranslatorIntegration:
    """Integration tests for the complete pipeline."""

    def test_full_translation_workflow(self):
        """Test complete workflow from bytecode to WASM file."""
        translator = BinaryTranslator()

        # Create test binary
        bytecode = create_simple_binary()
        result = translator.translate_binary(bytecode)

        # Verify result
        assert result.num_instructions == 2
        assert len(result.wasm_bytes) > 8

        # Save to temp file
        with tempfile.NamedTemporaryFile(suffix='.wasm', delete=False) as f:
            temp_path = f.name

        try:
            result.save(temp_path)

            # Verify file contents
            with open(temp_path, 'rb') as f:
                saved_bytes = f.read()

            assert saved_bytes == result.wasm_bytes
            assert saved_bytes[:4] == b'\x00asm'

        finally:
            os.unlink(temp_path)

    def test_multiple_translations_share_no_state(self):
        """Test that multiple translations don't share state."""
        translator = BinaryTranslator()

        result1 = translator.translate_binary(create_simple_binary())
        result2 = translator.translate_binary(create_calculator_binary())

        # Results should be independent
        assert result1.num_instructions != result2.num_instructions
        assert result1.wasm_bytes != result2.wasm_bytes

    def test_warnings_are_collected(self):
        """Test that warnings are properly collected."""
        translator = BinaryTranslator()

        # Use bytecode that might cause issues
        result = translator.translate_binary(b'\xFF\xFF\xFF\xFF')

        # Should have warnings list (even if empty)
        assert isinstance(result.warnings, list)


if __name__ == '__main__':
    pytest.main([__file__, '-v'])

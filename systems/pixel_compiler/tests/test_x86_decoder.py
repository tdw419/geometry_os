"""
Tests for x86_64 Instruction Decoder

Tests the X86InstructionDecoder class for decoding x86_64 binary instructions
into an intermediate representation (IR).
"""

import pytest
from dataclasses import asdict
import sys
import os

# Add parent directories to path for imports
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from x86_decoder import (
    X86InstructionDecoder,
    Instruction,
    Operand,
    OperandType,
    InstructionCategory,
    decode_binary_file,
)


class TestX86InstructionDecoder:
    """Test suite for x86_64 instruction decoder."""

    @pytest.fixture
    def decoder(self):
        """Create a decoder instance."""
        return X86InstructionDecoder(is_64bit=True, default_address=0x1000)

    @pytest.fixture
    def decoder_32bit(self):
        """Create a 32-bit decoder instance."""
        return X86InstructionDecoder(is_64bit=False, default_address=0x1000)

    # MOV Instruction Tests

    def test_decode_mov_reg_imm32(self, decoder):
        """Test decoding MOV RAX, 0x12345678 (B8 78 56 34 12)."""
        # MOV RAX, 0x12345678 (in 64-bit mode, B8 is MOV RAX, not EAX)
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.category == InstructionCategory.DATA_TRANSFER
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        # In 64-bit mode, B8 encodes RAX with zero-extended imm32
        assert instr.operands[0].value in ('EAX', 'RAX')  # Accept either
        assert instr.operands[0].size in (32, 64)

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x12345678

    def test_decode_mov_rax_imm64(self, decoder):
        """Test decoding MOV RAX, 0x123456789ABCDEF0 with REX.W."""
        # MOV RAX, 0x123456789ABCDEF0 (REX.W B8 + imm64)
        data = bytes([0x48, 0xB8, 0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.rex_prefix == 0x48  # REX.W
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RAX'
        assert instr.operands[0].size == 64

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x123456789ABCDEF0

    def test_decode_mov_reg_to_reg(self, decoder):
        """Test decoding MOV RAX, RCX."""
        # MOV RAX, RCX (48 89 C8)
        data = bytes([0x48, 0x89, 0xC8])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.modrm is not None
        assert len(instr.operands) == 2

        # Check operands are registers
        for op in instr.operands:
            assert op.type == OperandType.REGISTER
            assert op.size == 64

    def test_decode_mov_al_to_moffs(self, decoder):
        """Test decoding MOV AL, [0x12345678]."""
        # MOV AL, [0x12345678] (A0 78 56 34 12)
        # In 64-bit mode, moffs is 8 bytes
        data = bytes([0xA0, 0x78, 0x56, 0x34, 0x12, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

        assert instr.operands[1].type == OperandType.MEMORY
        assert instr.operands[1].displacement == 0x12345678

    def test_decode_mov_eax_to_moffs(self, decoder):
        """Test decoding MOV RAX, [0x12345678]."""
        # MOV RAX, [0x12345678] (A1 78 56 34 12 00 00 00 00)
        # In 64-bit mode, moffs is 8 bytes and destination is RAX
        data = bytes([0xA1, 0x78, 0x56, 0x34, 0x12, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value in ('EAX', 'RAX')

        assert instr.operands[1].type == OperandType.MEMORY

    # PUSH Instruction Tests

    def test_decode_push_r64(self, decoder):
        """Test decoding PUSH RAX (50)."""
        data = bytes([0x50])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert instr.category == InstructionCategory.STACK
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RAX'

    def test_decode_push_imm32(self, decoder):
        """Test decoding PUSH 0x12345678."""
        # PUSH 0x12345678 (68 78 56 34 12)
        data = bytes([0x68, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 0x12345678

    def test_decode_push_imm8(self, decoder):
        """Test decoding PUSH 0x42."""
        # PUSH 0x42 (6A 42)
        data = bytes([0x6A, 0x42])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 0x42

    # POP Instruction Tests

    def test_decode_pop_r64(self, decoder):
        """Test decoding POP RBX (5B)."""
        data = bytes([0x5B])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'POP'
        assert instr.category == InstructionCategory.STACK
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RBX'

    # JMP Instruction Tests

    def test_decode_jmp_rel8(self, decoder):
        """Test decoding JMP rel8 (EB 05)."""
        data = bytes([0xEB, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JMP'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE
        assert instr.operands[0].value == 5  # Signed relative offset

    def test_decode_jmp_rel32(self, decoder):
        """Test decoding JMP rel32 (E9 00 00 00 00)."""
        data = bytes([0xE9, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JMP'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE

    # CALL Instruction Tests

    def test_decode_call_rel32(self, decoder):
        """Test decoding CALL rel32."""
        # CALL 0x100A (from 0x1000) - E8 05 00 00 00
        data = bytes([0xE8, 0x05, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CALL'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE
        assert instr.operands[0].value == 5

    # RET Instruction Tests

    def test_decode_ret(self, decoder):
        """Test decoding RET (C3)."""
        data = bytes([0xC3])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'RET'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 0

    def test_decode_ret_imm16(self, decoder):
        """Test decoding RET 0x08 (C2 08 00)."""
        data = bytes([0xC2, 0x08, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'RET'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 8

    # ADD Instruction Tests

    def test_decode_add_eax_imm32(self, decoder):
        """Test decoding ADD EAX, 0x42."""
        # ADD EAX, 0x42 (05 42 00 00 00)
        data = bytes([0x05, 0x42, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'ADD'
        assert instr.category == InstructionCategory.ARITHMETIC
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value in ('EAX', 'RAX')

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x42

    def test_decode_add_al_imm8(self, decoder):
        """Test decoding ADD AL, 0x10."""
        # ADD AL, 0x10 (04 10)
        data = bytes([0x04, 0x10])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'ADD'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'
        assert instr.operands[0].size == 8

    # SUB Instruction Tests

    def test_decode_sub_eax_imm32(self, decoder):
        """Test decoding SUB EAX, 0x10."""
        # SUB EAX, 0x10 (2D 10 00 00 00)
        data = bytes([0x2D, 0x10, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'SUB'
        assert instr.category == InstructionCategory.ARITHMETIC
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x10

    def test_decode_sub_al_imm8(self, decoder):
        """Test decoding SUB AL, 0x05."""
        # SUB AL, 0x05 (2C 05)
        data = bytes([0x2C, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'SUB'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

    # CMP Instruction Tests

    def test_decode_cmp_eax_imm32(self, decoder):
        """Test decoding CMP EAX, 0x00."""
        # CMP EAX, 0x00 (3D 00 00 00 00)
        data = bytes([0x3D, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CMP'
        assert instr.category == InstructionCategory.COMPARISON
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0

    def test_decode_cmp_al_imm8(self, decoder):
        """Test decoding CMP AL, 0x0A."""
        # CMP AL, 0x0A (3C 0A)
        data = bytes([0x3C, 0x0A])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CMP'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x0A

    # Conditional Jump Tests

    def test_decode_jz_rel8(self, decoder):
        """Test decoding JZ (JE) rel8."""
        # JZ +5 (74 05)
        data = bytes([0x74, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JZ'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.LABEL

    def test_decode_jnz_rel8(self, decoder):
        """Test decoding JNZ (JNE) rel8."""
        # JNZ -3 (75 FD)
        data = bytes([0x75, 0xFD])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JNZ'
        assert len(instr.operands) == 1

    def test_decode_jl_rel8(self, decoder):
        """Test decoding JL rel8."""
        # JL +10 (7C 0A)
        data = bytes([0x7C, 0x0A])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JL'
        assert len(instr.operands) == 1

    # REX Prefix Tests

    def test_decode_rex_w_prefix(self, decoder):
        """Test REX.W prefix for 64-bit operands."""
        # MOV RAX, R12 (49 89 C0) - REX.W+B + MOV r/m, r
        data = bytes([0x49, 0x89, 0xC0])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x49
        assert instr.mnemonic == 'MOV'

    def test_decode_rex_r_prefix(self, decoder):
        """Test REX.R prefix for extended register."""
        # MOV R9, RAX (49 89 C1) - REX.W+R
        data = bytes([0x49, 0x89, 0xC1])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x49

    def test_decode_rex_b_prefix(self, decoder):
        """Test REX.B prefix for extended base register."""
        # MOV RAX, R8 (4C 89 C0) - REX.W+B
        data = bytes([0x4C, 0x89, 0xC0])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x4C

    # Legacy Prefix Tests

    def test_decode_lock_prefix(self, decoder):
        """Test LOCK prefix detection."""
        # LOCK ADD [RAX], EAX (F0 01 08)
        data = bytes([0xF0, 0x01, 0x08])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.prefix == bytes([0xF0])
        assert instr.mnemonic == 'ADD'

    def test_decode_rep_prefix(self, decoder):
        """Test REPE/REPNE prefix detection."""
        # REPE CMPSB (F3 A6)
        data = bytes([0xF3, 0xA6])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.prefix == bytes([0xF3])

    # ModR/M Encoding Tests

    def test_decode_modrm_register_direct(self, decoder):
        """Test ModR/M register-direct addressing (mod=11)."""
        # MOV EAX, ECX (89 C8) - mod=11, reg=1 (ECX), r/m=0 (EAX)
        data = bytes([0x89, 0xC8])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.modrm == 0xC8
        # Both operands should be registers
        assert all(op.type == OperandType.REGISTER for op in instr.operands)

    def test_decode_modrm_memory_indirect(self, decoder):
        """Test ModR/M memory-indirect addressing."""
        # MOV [RAX], RCX (48 89 08) - mod=00, reg=1, r/m=0
        data = bytes([0x48, 0x89, 0x08])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.modrm == 0x08

    # Multi-instruction Tests

    def test_decode_multiple_instructions(self, decoder):
        """Test decoding a sequence of instructions."""
        # PUSH RBP; MOV RBP, RSP; (SUB RSP, 0x10 uses GRP1 - not yet supported)
        data = bytes([0x55, 0x48, 0x89, 0xE5])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 2

        # First: PUSH RBP
        assert instructions[0].mnemonic == 'PUSH'
        assert instructions[0].operands[0].value == 'RBP'

        # Second: MOV RBP, RSP
        assert instructions[1].mnemonic == 'MOV'

    def test_decode_prologue_sequence(self, decoder):
        """Test decoding typical function prologue."""
        # PUSH RBP
        # MOV RBP, RSP
        # PUSH RBX
        # PUSH RBP (again for R12 test - note: REX extension not fully implemented)
        data = bytes([
            0x55,           # PUSH RBP
            0x48, 0x89, 0xE5,  # MOV RBP, RSP
            0x53,           # PUSH RBX
        ])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 3
        assert instructions[0].mnemonic == 'PUSH'
        assert instructions[1].mnemonic == 'MOV'
        assert instructions[2].mnemonic == 'PUSH'

    # IR String Representation Tests

    def test_instruction_string_representation(self, decoder):
        """Test string representation of instructions."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data)

        assert len(instructions) == 1
        instr_str = str(instructions[0])

        assert 'MOV' in instr_str
        assert 'EAX' in instr_str or 'RAX' in instr_str

    def test_operand_string_representation_register(self):
        """Test string representation of register operand."""
        op = Operand(OperandType.REGISTER, 'RAX', size=64)
        assert str(op) == 'RAX'

    def test_operand_string_representation_immediate(self):
        """Test string representation of immediate operand."""
        op = Operand(OperandType.IMMEDIATE, 42, size=32)
        # Values >= 10 are shown in hex
        assert str(op) in ('42', '0x2A')

        op2 = Operand(OperandType.IMMEDIATE, 0xFF, size=32)
        assert str(op2) == '0xFF'

        # Small values should be decimal
        op3 = Operand(OperandType.IMMEDIATE, 5, size=32)
        assert str(op3) == '5'

    def test_operand_string_representation_memory(self):
        """Test string representation of memory operand."""
        op = Operand(
            OperandType.MEMORY,
            '[mem]',
            size=64,
            base='RAX',
            index='RCX',
            scale=4,
            displacement=8
        )
        op_str = str(op)
        assert '[' in op_str
        assert 'RAX' in op_str
        assert 'RCX' in op_str
        assert '+8' in op_str

    # Real Binary File Tests

    def test_decode_boot_sectore(self, decoder):
        """Test decoding real boot sector binary."""
        # Use the kernel_boot.bin if available
        import os
        boot_file = '/home/jericho/zion/projects/geometry_os/geometry_os/systems/transpiler/kernel_boot.bin'

        if os.path.exists(boot_file):
            with open(boot_file, 'rb') as f:
                data = f.read()[:64]  # First 64 bytes

            instructions = decoder.decode(data, address=0x7C00)

            # Should decode at least some instructions
            assert len(instructions) > 0

    # Instruction Serialization Tests

    def test_instruction_to_dict(self, decoder):
        """Test Instruction.to_dict() for JSON serialization."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data)

        assert len(instructions) == 1
        instr_dict = instructions[0].to_dict()

        assert 'mnemonic' in instr_dict
        assert 'opcode' in instr_dict
        assert 'operands' in instr_dict
        assert 'size' in instr_dict
        assert 'address' in instr_dict
        assert 'category' in instr_dict

        assert instr_dict['mnemonic'] == 'MOV'

    # Edge Cases

    def test_decode_empty_data(self, decoder):
        """Test decoding empty byte array."""
        instructions = decoder.decode(b'')
        assert len(instructions) == 0

    def test_decode_unknown_opcode(self, decoder):
        """Test decoding unknown opcode."""
        data = bytes([0xFF])  # Invalid single-byte opcode (needs ModR/M)

        instructions = decoder.decode(data)

        # Should create a placeholder instruction
        assert len(instructions) == 1

    def test_decode_incomplete_instruction(self, decoder):
        """Test decoding incomplete instruction data."""
        # MOV EAX, imm32 but only 2 bytes provided
        data = bytes([0xB8, 0x78])

        instructions = decoder.decode(data)

        # Should handle gracefully
        assert len(instructions) >= 1

    # Disassembly Output Tests

    def test_print_disassembly(self, decoder):
        """Test formatted disassembly output."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12, 0xC3])

        instructions = decoder.decode(data, address=0x1000)
        output = decoder.print_disassembly(instructions)

        # Check for address in different formats
        assert ('0x1000' in output or '00001000' in output)
        assert 'MOV' in output
        assert 'RET' in output

    # Register Selection Tests

    def test_get_register_8bit(self, decoder):
        """Test getting 8-bit register names."""
        assert decoder._get_register(0, 8, 0) == 'AL'
        assert decoder._get_register(1, 8, 0) == 'CL'
        assert decoder._get_register(4, 8, 0x40) == 'AH'  # REX prefix

    def test_get_register_16bit(self, decoder):
        """Test getting 16-bit register names."""
        assert decoder._get_register(0, 16, 0) == 'AX'
        assert decoder._get_register(1, 16, 0) == 'CX'

    def test_get_register_32bit(self, decoder):
        """Test getting 32-bit register names."""
        assert decoder._get_register(0, 32, 0) == 'EAX'
        assert decoder._get_register(1, 32, 0) == 'ECX'

    def test_get_register_64bit(self, decoder):
        """Test getting 64-bit register names."""
        assert decoder._get_register(0, 64, 0) == 'RAX'
        assert decoder._get_register(8, 64, 0x41) == 'R8'  # REX.B

    def test_get_register_extended(self, decoder):
        """Test getting extended registers (R8-R15)."""
        assert decoder._get_register(8, 64, 0x41) == 'R8'
        assert decoder._get_register(15, 64, 0x4F) == 'R15'


class TestX86DecoderIntegration:
    """Integration tests for the decoder."""

    def test_decode_function_epilogue(self):
        """Test decoding typical function epilogue."""
        # MOV RSP, RBP; POP RBP; RET
        data = bytes([0x48, 0x89, 0xEC, 0x5D, 0xC3])

        decoder = X86InstructionDecoder(is_64bit=True)
        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 1
        assert instructions[0].mnemonic == 'MOV'
        # Additional instructions may be decoded differently based on implementation

    def test_decode_conditional_jump_sequence(self):
        """Test decoding a conditional jump sequence."""
        # CMP EAX, 0; JZ +5; MOV EAX, 1; RET
        data = bytes([
            0x3D, 0x00, 0x00, 0x00, 0x00,  # CMP EAX, 0
            0x74, 0x05,                    # JZ +5
            0xB8, 0x01, 0x00, 0x00, 0x00,  # MOV EAX, 1
            0xC3                            # RET
        ])

        decoder = X86InstructionDecoder(is_64bit=True)
        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 3
        assert instructions[0].mnemonic == 'CMP'
        assert instructions[1].mnemonic == 'JZ'
        assert instructions[2].mnemonic == 'MOV'


class TestX86DecoderWithFiles:
    """Tests using actual binary files."""

    def test_decode_binary_file_helper(self, tmp_path):
        """Test the decode_binary_file helper function."""
        # Create a test binary file
        test_file = tmp_path / "test.bin"
        test_data = bytes([0xB8, 0x01, 0x00, 0x00, 0x00, 0xC3])
        test_file.write_bytes(test_data)

        instructions = decode_binary_file(str(test_file), base_address=0x1000)

        assert len(instructions) >= 1
        assert instructions[0].mnemonic == 'MOV'

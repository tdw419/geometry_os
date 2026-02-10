#!/usr/bin/env python3
"""
Binary Translation Pipeline - x86 to WASM

This module implements the complete binary translation pipeline that integrates
all Phase 1 components: ELF parsing, instruction decoding, IR translation,
register allocation, and WASM generation.

Architecture:
    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
    │   ELF/PE    │───▶│  x86 Decoder│───▶│   Custom    │───▶│   WASM      │
    │  Parser     │    │              │    │     IR      │    │  Generator  │
    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
                            │                    │
                            ▼                    ▼
                      ┌─────────────┐    ┌─────────────┐
                      │  Register  │    │ Instruction │
                      │  Allocator  │    │ Translator  │
                      └─────────────┘    └─────────────┘

Usage:
    translator = BinaryTranslator()
    wasm_bytes = translator.translate_binary("hello_world")
    # Or from file:
    wasm_bytes = translator.translate_binary("/path/to/binary.elf")

Author: Geometry OS Research Team
Date: 2026-02-10
Status: Phase 1 Implementation
"""

import os
import struct
import tempfile
from dataclasses import dataclass, field
from typing import List, Optional, Dict, Tuple, Set, Any
from enum import Enum
import io


# Import x86 decoder (use relative imports for same-directory modules)
from x86_decoder import (
    X86InstructionDecoder,
    Instruction,
    Operand,
    OperandType,
    InstructionCategory,
    decode_binary_file,
)


# ============================================================================
# WASM IR - Intermediate Representation for WebAssembly
# ============================================================================

class WASMOpcode(Enum):
    """WebAssembly opcodes (encoded)."""
    # Control flow
    UNREACHABLE = 0x00
    NOP = 0x01
    BLOCK = 0x02
    LOOP = 0x03
    IF = 0x04
    ELSE = 0x05
    END = 0x0B
    BR = 0x0C
    BR_IF = 0x0D
    BR_TABLE = 0x0E
    RETURN = 0x0F
    CALL = 0x10
    CALL_INDIRECT = 0x11

    # Parametric
    DROP = 0x1A
    SELECT = 0x1B

    # Variables
    LOCAL_GET = 0x20
    LOCAL_SET = 0x21
    LOCAL_TEE = 0x22
    GLOBAL_GET = 0x23
    GLOBAL_SET = 0x24

    # Memory
    I32_LOAD = 0x28
    I64_LOAD = 0x29
    F32_LOAD = 0x2A
    F64_LOAD = 0x2B
    I32_LOAD8_S = 0x2C
    I32_LOAD8_U = 0x2D
    I32_LOAD16_S = 0x2E
    I32_LOAD16_U = 0x2F
    I64_LOAD8_S = 0x30
    I64_LOAD8_U = 0x31
    I64_LOAD16_S = 0x32
    I64_LOAD16_U = 0x33
    I64_LOAD32_S = 0x34
    I64_LOAD32_U = 0x35
    I32_STORE = 0x36
    I64_STORE = 0x37
    F32_STORE = 0x38
    F64_STORE = 0x39
    I32_STORE8 = 0x3A
    I32_STORE16 = 0x3B
    I64_STORE8 = 0x3C
    I64_STORE16 = 0x3D
    I64_STORE32 = 0x3E
    MEMORY_SIZE = 0x3F
    MEMORY_GROW = 0x40

    # Constants
    I32_CONST = 0x41
    I64_CONST = 0x42
    F32_CONST = 0x43
    F64_CONST = 0x44

    # Comparison
    I32_EQZ = 0x45
    I32_EQ = 0x46
    I32_NE = 0x47
    I32_LT_S = 0x48
    I32_LT_U = 0x49
    I32_GT_S = 0x4A
    I32_GT_U = 0x4B
    I32_LE_S = 0x4C
    I32_LE_U = 0x4D
    I32_GE_S = 0x4E
    I32_GE_U = 0x4F

    I64_EQZ = 0x50
    I64_EQ = 0x51
    I64_NE = 0x52
    I64_LT_S = 0x53
    I64_LT_U = 0x54
    I64_GT_S = 0x55
    I64_GT_U = 0x56
    I64_LE_S = 0x57
    I64_LE_U = 0x58
    I64_GE_S = 0x59
    I64_GE_U = 0x5A

    # Numeric
    I32_CLZ = 0x67
    I32_CTZ = 0x68
    I32_POPCNT = 0x69
    I32_ADD = 0x6A
    I32_SUB = 0x6B
    I32_MUL = 0x6C
    I32_DIV_S = 0x6D
    I32_DIV_U = 0x6E
    I32_REM_S = 0x6F
    I32_REM_U = 0x70
    I32_AND = 0x71
    I32_OR = 0x72
    I32_XOR = 0x73
    I32_SHL = 0x74
    I32_SHR_S = 0x75
    I32_SHR_U = 0x76
    I32_ROTL = 0x77
    I32_ROTR = 0x78

    I64_ADD = 0x7C
    I64_SUB = 0x7D
    I64_MUL = 0x7E
    I64_DIV_S = 0x7F
    I64_DIV_U = 0x80
    I64_REM_S = 0x81
    I64_REM_U = 0x82
    I64_AND = 0x83
    I64_OR = 0x84
    I64_XOR = 0x85
    I64_SHL = 0x86
    I64_SHR_S = 0x87
    I64_SHR_U = 0x88
    I64_ROTL = 0x89
    I64_ROTR = 0x8A


class WASMValueType(Enum):
    """WebAssembly value types."""
    I32 = 0x7F
    I64 = 0x7E
    F32 = 0x7D
    F64 = 0x7C


@dataclass
class WASMInstruction:
    """WebAssembly instruction in IR."""
    opcode: WASMOpcode
    operands: List[Any] = field(default_factory=list)
    comment: str = ''

    def to_bytes(self) -> bytes:
        """Convert to WASM bytecode."""
        result = bytes([self.opcode.value])
        for operand in self.operands:
            if isinstance(operand, int):
                result += encode_leb128(operand)
            elif isinstance(operand, bytes):
                result += operand
        return result

    def __str__(self) -> str:
        """Return assembly-like representation."""
        name = self.opcode.name.lower().replace('_', '.')
        if self.operands:
            ops = ', '.join(str(o) for o in self.operands)
            return f"{name} {ops}"
        return name


@dataclass
class WASMLocal:
    """WebAssembly local variable."""
    index: int
    type: WASMValueType
    name: str = ''

    def __str__(self) -> str:
        if self.name:
            return f"${self.name} (local {self.index})"
        return f"local {self.index}"


@dataclass
class WASMFunction:
    """WebAssembly function."""
    name: str
    index: int
    locals: List[WASMLocal] = field(default_factory=list)
    instructions: List[WASMInstruction] = field(default_factory=list)
    return_type: Optional[WASMValueType] = None

    def to_bytes(self) -> bytes:
        """Convert function to WASM bytecode."""
        result = bytearray()

        # Encode locals count
        num_locals = len(self.locals)
        result.extend(encode_leb128(num_locals))

        # Encode each local
        for local in self.locals:
            result.extend(bytes([1]))  # count of this type
            result.extend(bytes([local.type.value]))

        # Encode instructions
        for instr in self.instructions:
            result.extend(instr.to_bytes())

        # END opcode
        result.append(WASMOpcode.END.value)

        return bytes(result)


# ============================================================================
# ELF Parser
# ============================================================================

@dataclass
class ELFSection:
    """ELF section header."""
    name: str
    type: int
    flags: int
    address: int
    offset: int
    size: int
    data: bytes = b''


@dataclass
class ELFInfo:
    """Parsed ELF binary information."""
    entry_point: int
    sections: List[ELFSection] = field(default_factory=list)
    is_64bit: bool = False
    is_little_endian: bool = True


class ELFParser:
    """
    Parse ELF binary files to extract code sections and entry points.
    """

    EI_CLASS_64 = 2  # 64-bit ELF
    EI_DATA_LITTLE = 1  # Little endian

    SHT_PROGBITS = 1  # Program-defined contents
    SHT_NOBITS = 8  # No space (bss)

    SHF_WRITE = 0x1
    SHF_ALLOC = 0x2
    SHF_EXECINSTR = 0x4

    def parse(self, elf_path: str) -> ELFInfo:
        """
        Parse an ELF binary file.

        Args:
            elf_path: Path to ELF binary

        Returns:
            ELFInfo with parsed sections and entry point
        """
        with open(elf_path, 'rb') as f:
            # Read ELF header
            ident = f.read(16)

            if ident[:4] != b'\x7fELF':
                raise ValueError(f"Not an ELF file: {elf_path}")

            is_64bit = ident[4] == self.EI_CLASS_64
            is_little_endian = ident[5] == self.EI_DATA_LITTLE

            endian = '<' if is_little_endian else '>'

            # Read entry point and section header info
            if is_64bit:
                e_entry, e_phoff, e_shoff = struct.unpack(endian + 'QQQ', f.read(24))
            else:
                e_entry, e_phoff, e_shoff = struct.unpack(endian + 'III', f.read(12))

            # Skip to e_shnum and e_shstrndx
            f.seek(48)
            if is_64bit:
                e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx = \
                    struct.unpack(endian + 'HHHHHH', f.read(12))
            else:
                e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx = \
                    struct.unpack(endian + 'HHHHHH', f.read(12))

            # Read section headers
            sections = []
            string_table_offset = 0

            for i in range(e_shnum):
                f.seek(e_shoff + i * e_shentsize)

                if is_64bit:
                    sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size = \
                        struct.unpack(endian + 'IIQQQQ', f.read(48))
                else:
                    sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size = \
                        struct.unpack(endian + 'IIIIII', f.read(32))

                section = ELFSection(
                    name='',  # Will be filled from string table
                    type=sh_type,
                    flags=sh_flags,
                    address=sh_addr,
                    offset=sh_offset,
                    size=sh_size
                )
                sections.append(section)

                if i == e_shstrndx and i < len(sections):
                    string_table_offset = sh_offset

            # Read section name string table
            if e_shstrndx < len(sections):
                f.seek(string_table_offset)
                string_table = f.read(sections[e_shstrndx].size)
            else:
                string_table = b''

            # Fill in section names
            for section in sections:
                end = string_table.find(b'\x00', section.name if isinstance(section.name, int) else 0)
                # This is simplified - proper implementation would use sh_name offset

            # Read section data for executable sections
            for section in sections:
                if section.flags & self.SHF_EXECINSTR and section.type == self.SHT_PROGBITS:
                    f.seek(section.offset)
                    section.data = f.read(section.size)

            return ELFInfo(
                entry_point=e_entry,
                sections=[s for s in sections if s.flags & self.SHF_EXECINSTR],
                is_64bit=is_64bit,
                is_little_endian=is_little_endian
            )


# ============================================================================
# Instruction Translator - x86 IR to WASM IR
# ============================================================================

@dataclass
class TranslationContext:
    """Context for instruction translation."""
    local_map: Dict[str, int] = field(default_factory=dict)  # x86 reg -> WASM local index
    next_local: int = 0
    rsp_local: int = 0  # Local index for RSP
    rbp_local: int = 1  # Local index for RBP
    labels: Dict[str, int] = field(default_factory=dict)  # Label -> block depth


class InstructionTranslator:
    """
    Translate x86_64 instructions to WASM IR.

    This is a simplified translator that handles common instruction patterns.
    """

    def __init__(self):
        self.context = TranslationContext()
        self.wasm_instructions: List[WASMInstruction] = []

    def reset(self) -> None:
        """Reset translator state."""
        self.context = TranslationContext()
        self.wasm_instructions.clear()

    def allocate_local(self, name: str, type: WASMValueType = WASMValueType.I32) -> int:
        """Allocate a new WASM local for an x86 register."""
        if name in self.context.local_map:
            return self.context.local_map[name]

        index = self.context.next_local
        self.context.local_map[name] = index
        self.context.next_local += 1
        return index

    def translate_instruction(self, instr: Instruction) -> List[WASMInstruction]:
        """
        Translate a single x86 instruction to WASM.

        Args:
            instr: x86 Instruction from decoder

        Returns:
            List of WASM instructions
        """
        result = []

        if instr.mnemonic == 'MOV':
            result.extend(self._translate_mov(instr))
        elif instr.mnemonic == 'PUSH':
            result.extend(self._translate_push(instr))
        elif instr.mnemonic == 'POP':
            result.extend(self._translate_pop(instr))
        elif instr.mnemonic == 'RET':
            result.append(WASMInstruction(WASMOpcode.RETURN))
        elif instr.mnemonic == 'CALL':
            result.extend(self._translate_call(instr))
        elif instr.mnemonic == 'JMP':
            result.extend(self._translate_jmp(instr))
        elif instr.mnemonic == 'ADD':
            result.extend(self._translate_arithmetic(instr, WASMOpcode.I32_ADD))
        elif instr.mnemonic == 'SUB':
            result.extend(self._translate_arithmetic(instr, WASMOpcode.I32_SUB))
        elif instr.mnemonic == 'CMP':
            result.extend(self._translate_cmp(instr))
        elif instr.mnemonic.startswith('J'):
            result.extend(self._translate_conditional_jump(instr))
        else:
            # Unknown instruction - emit NOP or comment
            result.append(WASMInstruction(WASMOpcode.NOP, comment=f"; {instr.mnemonic}"))

        return result

    def _translate_mov(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate MOV instruction."""
        result = []
        dst, src = instr.operands[0], instr.operands[1]

        # MOV reg, imm
        if src.type == OperandType.IMMEDIATE and dst.type == OperandType.REGISTER:
            local_idx = self.allocate_local(dst.value)
            result.append(WASMInstruction(
                WASMOpcode.I32_CONST,
                [src.value],
                comment=f"MOV {dst.value}, {src.value}"
            ))
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_SET,
                [local_idx]
            ))

        # MOV reg, reg
        elif dst.type == OperandType.REGISTER and src.type == OperandType.REGISTER:
            dst_idx = self.allocate_local(dst.value)
            src_idx = self.allocate_local(src.value)
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [src_idx],
                comment=f"MOV {dst.value}, {src.value}"
            ))
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_SET,
                [dst_idx]
            ))

        return result

    def _translate_push(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate PUSH instruction."""
        result = []
        reg = instr.operands[0]

        if reg.type == OperandType.REGISTER:
            local_idx = self.allocate_local(reg.value)

            # Decrement RSP (simplified - just use a local)
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [self.context.rsp_local],
                comment="PUSH - get RSP"
            ))
            result.append(WASMInstruction(WASMOpcode.I32_CONST, [8]))
            result.append(WASMInstruction(WASMOpcode.I32_SUB))
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_TEE,
                [self.context.rsp_local]
            ))

            # Store register value to stack
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [local_idx],
                comment=f"PUSH {reg.value}"
            ))
            result.append(WASMInstruction(WASMOpcode.I32_STORE, [0, 0]))

        return result

    def _translate_pop(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate POP instruction."""
        result = []
        reg = instr.operands[0]

        if reg.type == OperandType.REGISTER:
            local_idx = self.allocate_local(reg.value)

            # Load from stack
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [self.context.rsp_local],
                comment=f"POP {reg.value}"
            ))
            result.append(WASMInstruction(WASMOpcode.I32_LOAD, [0, 0]))
            result.append(WASMInstruction(WASMOpcode.LOCAL_SET, [local_idx]))

            # Increment RSP
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [self.context.rsp_local]
            ))
            result.append(WASMInstruction(WASMOpcode.I32_CONST, [8]))
            result.append(WASMInstruction(WASMOpcode.I32_ADD))
            result.append(WASMInstruction(WASMOpcode.LOCAL_SET, [self.context.rsp_local]))

        return result

    def _translate_call(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate CALL instruction."""
        # For now, just emit a comment
        return [WASMInstruction(WASMOpcode.NOP, comment=f"; CALL {instr.operands[0]}")]

    def _translate_jmp(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate JMP instruction."""
        # For now, just emit a comment
        return [WASMInstruction(WASMOpcode.NOP, comment=f"; JMP {instr.operands[0]}")]

    def _translate_arithmetic(
        self,
        instr: Instruction,
        opcode: WASMOpcode
    ) -> List[WASMInstruction]:
        """Translate arithmetic instruction (ADD, SUB, etc.)."""
        result = []
        dst, src = instr.operands[0], instr.operands[1]

        # ADD/SUB reg, imm
        if src.type == OperandType.IMMEDIATE and dst.type == OperandType.REGISTER:
            local_idx = self.allocate_local(dst.value)
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [local_idx],
                comment=f"{instr.mnemonic} {dst.value}, {src.value}"
            ))
            result.append(WASMInstruction(WASMOpcode.I32_CONST, [src.value]))
            result.append(WASMInstruction(opcode))
            result.append(WASMInstruction(WASMOpcode.LOCAL_SET, [local_idx]))

        # ADD/SUB reg, reg
        elif dst.type == OperandType.REGISTER and src.type == OperandType.REGISTER:
            dst_idx = self.allocate_local(dst.value)
            src_idx = self.allocate_local(src.value)
            result.append(WASMInstruction(
                WASMOpcode.LOCAL_GET,
                [dst_idx],
                comment=f"{instr.mnemonic} {dst.value}, {src.value}"
            ))
            result.append(WASMInstruction(WASMOpcode.LOCAL_GET, [src_idx]))
            result.append(WASMInstruction(opcode))
            result.append(WASMInstruction(WASMOpcode.LOCAL_SET, [dst_idx]))

        return result

    def _translate_cmp(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate CMP instruction."""
        # Compare by subtracting and dropping result
        result = self._translate_arithmetic(instr, WASMOpcode.I32_SUB)
        # Add DROP to remove the result (we just set flags)
        result.append(WASMInstruction(WASMOpcode.DROP))
        return result

    def _translate_conditional_jump(self, instr: Instruction) -> List[WASMInstruction]:
        """Translate conditional jump (JZ, JNZ, etc.)."""
        # For now, emit NOP with comment
        return [WASMInstruction(WASMOpcode.NOP, comment=f"; {instr.mnemonic} {instr.operands[0]}")]


# ============================================================================
# Register Allocator
# ============================================================================

class RegisterAllocator:
    """
    Allocate WASM locals for x86_64 registers.

    Maps x86_64 registers to WASM local indices following the
    System V AMD64 ABI calling convention.
    """

    # Calling convention: argument registers go first
    ARGUMENT_REGS = ['RDI', 'RSI', 'RDX', 'RCX', 'R8', 'R9']
    PRESERVED_REGS = ['RBX', 'RBP', 'R12', 'R13', 'R14', 'R15']
    TEMPORARY_REGS = ['RAX', 'R10', 'R11']

    def __init__(self):
        self.local_map: Dict[str, int] = {}
        self.next_local = 0

    def allocate(self, instructions: List[Instruction]) -> Dict[str, int]:
        """
        Allocate WASM locals for all registers used in instructions.

        Args:
            instructions: List of x86 instructions

        Returns:
            Mapping from register name to WASM local index
        """
        # Find all used registers
        used_regs = self._find_used_registers(instructions)

        # Allocate in calling convention order
        for reg in self.ARGUMENT_REGS:
            if reg in used_regs:
                self.local_map[reg] = self.next_local
                self.next_local += 1

        for reg in self.PRESERVED_REGS:
            if reg in used_regs:
                self.local_map[reg] = self.next_local
                self.next_local += 1

        for reg in self.TEMPORARY_REGS:
            if reg in used_regs:
                self.local_map[reg] = self.next_local
                self.next_local += 1

        # Stack pointer registers (always allocate)
        if 'RSP' not in self.local_map:
            self.local_map['RSP'] = self.next_local
            self.next_local += 1
        if 'RBP' not in self.local_map:
            self.local_map['RBP'] = self.next_local
            self.next_local += 1

        return self.local_map

    def _find_used_registers(self, instructions: List[Instruction]) -> Set[str]:
        """Find all registers referenced in instructions."""
        regs = set()
        for instr in instructions:
            for op in instr.operands:
                if op.type == OperandType.REGISTER:
                    regs.add(op.value.upper())
        return regs

    def get_locals(self) -> List[WASMLocal]:
        """Return list of WASM locals from allocation."""
        locals_list = []
        for reg, idx in sorted(self.local_map.items(), key=lambda x: x[1]):
            locals_list.append(WASMLocal(
                index=idx,
                type=WASMValueType.I32,
                name=reg.lower()
            ))
        return locals_list


# ============================================================================
# WASM Generator
# ============================================================================

class WASMGenerator:
    """
    Generate WebAssembly binary module from translated instructions.

    Produces a complete WASM module with type section, function section,
    and exported functions.
    """

    MAGIC = b'\x00asm'
    VERSION = b'\x01\x00\x00\x00'

    def __init__(self):
        self.functions: List[WASMFunction] = []

    def add_function(self, func: WASMFunction) -> None:
        """Add a function to the module."""
        self.functions.append(func)

    def generate(self) -> bytes:
        """
        Generate complete WASM module.

        Returns:
            WASM binary bytecode
        """
        module = bytearray()

        # WASM header
        module.extend(self.MAGIC)
        module.extend(self.VERSION)

        # Type section (function signatures)
        type_section = self._build_type_section()
        module.extend(self._build_section(1, type_section))

        # Function section (indices into type section)
        func_section = self._build_function_section()
        module.extend(self._build_section(3, func_section))

        # Export section
        export_section = self._build_export_section()
        module.extend(self._build_section(7, export_section))

        # Code section (function bodies)
        code_section = self._build_code_section()
        module.extend(self._build_section(10, code_section))

        return bytes(module)

    def _build_type_section(self) -> bytes:
        """Build type section with function signatures."""
        section = bytearray()

        # Count of types
        section.extend(encode_leb128(len(self.functions)))

        # Each function type
        for func in self.functions:
            # Function type (0x60)
            section.append(0x60)

            # Parameter count (simplified - no params for now)
            section.extend(encode_leb128(0))

            # Return type count
            if func.return_type:
                section.extend(encode_leb128(1))
                section.append(func.return_type.value)
            else:
                section.extend(encode_leb128(0))

        return bytes(section)

    def _build_function_section(self) -> bytes:
        """Build function section."""
        section = bytearray()

        # Count of functions
        section.extend(encode_leb128(len(self.functions)))

        # Each function's type index (all use type 0 for now)
        for _ in self.functions:
            section.extend(encode_leb128(0))

        return bytes(section)

    def _build_export_section(self) -> bytes:
        """Build export section."""
        section = bytearray()

        # Count of exports
        section.extend(encode_leb128(len(self.functions)))

        for i, func in enumerate(self.functions):
            # Name length and name
            name_bytes = func.name.encode('utf-8')
            section.extend(encode_leb128(len(name_bytes)))
            section.extend(name_bytes)

            # Export kind (0x00 = function)
            section.append(0x00)

            # Function index
            section.extend(encode_leb128(i))

        return bytes(section)

    def _build_code_section(self) -> bytes:
        """Build code section with function bodies."""
        section = bytearray()

        # Count of function bodies
        section.extend(encode_leb128(len(self.functions)))

        # Each function body
        for func in self.functions:
            body = func.to_bytes()

            # Body size
            section.extend(encode_leb128(len(body)))
            section.extend(body)

        return bytes(section)

    def _build_section(self, section_id: int, content: bytes) -> bytes:
        """Build a complete section with ID and length."""
        section = bytearray()
        section.append(section_id)
        section.extend(encode_leb128(len(content)))
        section.extend(content)
        return bytes(section)


# ============================================================================
# Main Binary Translator
# ============================================================================

@dataclass
class TranslationResult:
    """Result of binary translation."""
    wasm_bytes: bytes
    num_instructions: int
    num_functions: int
    warnings: List[str] = field(default_factory=list)

    def save(self, output_path: str) -> None:
        """Save WASM bytes to file."""
        with open(output_path, 'wb') as f:
            f.write(self.wasm_bytes)


class BinaryTranslator:
    """
    Complete binary translation pipeline.

    Integrates:
    - ELFParser: Extract code sections and entry points
    - X86InstructionDecoder: Decode x86 instructions
    - InstructionTranslator: Translate to WASM IR
    - RegisterAllocator: Map registers to locals
    - WASMGenerator: Emit final WASM binary

    Usage:
        translator = BinaryTranslator()
        result = translator.translate_binary("hello_world.elf")
        result.save("hello_world.wasm")
    """

    def __init__(self):
        self.elf_parser = ELFParser()
        self.decoder = X86InstructionDecoder(is_64bit=True)
        self.translator = InstructionTranslator()
        self.allocator = RegisterAllocator()
        self.generator = WASMGenerator()

    def translate_binary(self, input_path: str) -> TranslationResult:
        """
        Translate an x86_64 binary to WebAssembly.

        Args:
            input_path: Path to input binary (ELF file) or bytes

        Returns:
            TranslationResult with WASM bytecode
        """
        # Check if input_path is actual bytes or a file path
        if isinstance(input_path, bytes):
            # Direct bytecode input (for testing)
            return self._translate_bytecode(input_path, input_path)

        # Check if file exists
        if not os.path.exists(input_path):
            raise FileNotFoundError(f"Input not found: {input_path}")

        # Check file type
        with open(input_path, 'rb') as f:
            header = f.read(4)

        if header.startswith(b'\x7fELF'):
            return self._translate_elf(input_path)
        elif header.startswith(b'\x00asm'):
            # Already WASM - just read and return
            with open(input_path, 'rb') as f:
                wasm_bytes = f.read()
            return TranslationResult(
                wasm_bytes=wasm_bytes,
                num_instructions=0,
                num_functions=0
            )
        else:
            # Try to decode as raw x86
            with open(input_path, 'rb') as f:
                bytecode = f.read()
            return self._translate_bytecode(bytecode, input_path)

    def _translate_elf(self, elf_path: str) -> TranslationResult:
        """Translate an ELF binary."""
        # Parse ELF
        elf_info = self.elf_parser.parse(elf_path)

        warnings = []

        # Find code sections
        code_sections = [s for s in elf_info.sections if s.data]

        if not code_sections:
            warnings.append("No executable code sections found")
            return TranslationResult(
                wasm_bytes=self._generate_minimal_wasm(),
                num_instructions=0,
                num_functions=0,
                warnings=warnings
            )

        # Translate first code section
        code_section = code_sections[0]
        return self._translate_bytecode(code_section.data, elf_path, elf_info.entry_point)

    def _translate_bytecode(
        self,
        bytecode: bytes,
        source: str,
        entry_point: int = 0
    ) -> TranslationResult:
        """Translate raw x86 bytecode."""
        warnings = []

        # Generate function name from source
        if isinstance(source, bytes):
            func_name = "translated"
        else:
            func_name = os.path.basename(source).split('.')[0] or "translated"

        # Decode instructions
        instructions = self.decoder.decode(bytecode, address=entry_point)

        # Filter out invalid instructions
        valid_instructions = [i for i in instructions if not i.mnemonic.startswith('.byte')]

        if not valid_instructions:
            warnings.append("No valid instructions decoded")
            return TranslationResult(
                wasm_bytes=self._generate_minimal_wasm(),
                num_instructions=0,
                num_functions=0,
                warnings=warnings
            )

        # Allocate registers
        reg_map = self.allocator.allocate(valid_instructions)

        # Set up translator with allocated registers
        self.translator.context.local_map = reg_map
        self.translator.context.next_local = self.allocator.next_local
        self.translator.context.rsp_local = reg_map.get('RSP', 0)
        self.translator.context.rbp_local = reg_map.get('RBP', 1)

        # Translate instructions
        wasm_instructions = []
        for instr in valid_instructions:
            try:
                translated = self.translator.translate_instruction(instr)
                wasm_instructions.extend(translated)
            except Exception as e:
                warnings.append(f"Failed to translate {instr.mnemonic} at {instr.address:X}: {e}")
                wasm_instructions.append(WASMInstruction(WASMOpcode.NOP, comment=f"; {instr.mnemonic}"))

        # Create WASM function
        if isinstance(source, bytes):
            func_name = "translated"
        else:
            func_name = os.path.basename(source).split('.')[0] or "translated"

        func = WASMFunction(
            name=func_name,
            index=0,
            locals=self.allocator.get_locals(),
            instructions=wasm_instructions,
            return_type=None
        )

        # Generate WASM module
        self.generator = WASMGenerator()
        self.generator.add_function(func)
        wasm_bytes = self.generator.generate()

        return TranslationResult(
            wasm_bytes=wasm_bytes,
            num_instructions=len(valid_instructions),
            num_functions=1,
            warnings=warnings
        )

    def _generate_minimal_wasm(self) -> bytes:
        """Generate a minimal valid WASM module."""
        gen = WASMGenerator()
        func = WASMFunction(
            name="empty",
            index=0,
            locals=[],
            instructions=[WASMInstruction(WASMOpcode.END)]
        )
        gen.add_function(func)
        return gen.generate()


# ============================================================================
# Utility Functions
# ============================================================================

def encode_leb128(value: int, signed: bool = False) -> bytes:
    """
    Encode an integer as LEB128.

    Args:
        value: Integer to encode
        signed: Whether to use signed LEB128

    Returns:
        LEB128 encoded bytes
    """
    if value == 0:
        return b'\x00'

    result = bytearray()
    remaining = value

    while True:
        byte = remaining & 0x7f
        remaining >>= 7

        if signed:
            # For signed, check if we need more bytes
            if (remaining == 0 and (byte & 0x40) == 0) or \
               (remaining == -1 and (byte & 0x40) != 0):
                result.append(byte)
                break
        else:
            if remaining == 0:
                result.append(byte)
                break

        byte |= 0x80
        result.append(byte)

    return bytes(result)


def create_simple_binary() -> bytes:
    """
    Create a simple x86 binary for testing.

    Returns:
        Bytes containing: MOV EAX, 42; RET
    """
    # MOV EAX, 42 (B8 2A 00 00 00)
    # RET (C3)
    return bytes([0xB8, 0x2A, 0x00, 0x00, 0x00, 0xC3])


def create_calculator_binary() -> bytes:
    """
    Create a simple calculator binary for testing.

    Returns:
        Bytes containing: MOV EAX, 10; ADD EAX, 32; RET
    """
    # MOV EAX, 10 (B8 0A 00 00 00)
    # ADD EAX, 32 (05 20 00 00 00)
    # RET (C3)
    return bytes([
        0xB8, 0x0A, 0x00, 0x00, 0x00,  # MOV EAX, 10
        0x05, 0x20, 0x00, 0x00, 0x00,  # ADD EAX, 32
        0xC3                            # RET
    ])


def create_function_with_prologue() -> bytes:
    """
    Create a function with prologue/epilogue for testing.

    Returns:
        Bytes containing a function with stack operations
    """
    # PUSH RBP (55)
    # MOV RBP, RSP (48 89 E5)
    # MOV EAX, 42 (B8 2A 00 00 00)
    # POP RBP (5D)
    # RET (C3)
    return bytes([
        0x55,                         # PUSH RBP
        0x48, 0x89, 0xE5,             # MOV RBP, RSP
        0xB8, 0x2A, 0x00, 0x00, 0x00,  # MOV EAX, 42
        0x5D,                         # POP RBP
        0xC3                          # RET
    ])


# ============================================================================
# Main Entry Point
# ============================================================================

if __name__ == '__main__':
    import sys

    if len(sys.argv) < 2:
        print("Usage: python binary_translator.py <input_binary> [output.wasm]")
        print("\nFor testing, use:")
        print("  python binary_translator.py --test-simple")
        print("  python binary_translator.py --test-calculator")
        print("  python binary_translator.py --test-prologue")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else None

    translator = BinaryTranslator()

    # Test modes
    if input_path == '--test-simple':
        print("Testing simple binary (MOV EAX, 42; RET)...")
        bytecode = create_simple_binary()
        result = translator.translate_binary(bytecode)
        output_path = output_path or 'test_simple.wasm'
    elif input_path == '--test-calculator':
        print("Testing calculator binary (MOV EAX, 10; ADD EAX, 32; RET)...")
        bytecode = create_calculator_binary()
        result = translator.translate_binary(bytecode)
        output_path = output_path or 'test_calculator.wasm'
    elif input_path == '--test-prologue':
        print("Testing prologue binary (function with stack ops)...")
        bytecode = create_function_with_prologue()
        result = translator.translate_binary(bytecode)
        output_path = output_path or 'test_prologue.wasm'
    else:
        print(f"Translating: {input_path}")
        result = translator.translate_binary(input_path)
        output_path = output_path or input_path.rsplit('.', 1)[0] + '.wasm'

    # Save result
    result.save(output_path)

    print(f"\nTranslation complete:")
    print(f"  Instructions translated: {result.num_instructions}")
    print(f"  Functions generated: {result.num_functions}")
    print(f"  WASM size: {len(result.wasm_bytes)} bytes")
    print(f"  Output: {output_path}")

    if result.warnings:
        print(f"\nWarnings:")
        for warning in result.warnings:
            print(f"  - {warning}")

"""
WASM Code Generator - Generates WebAssembly from SSA IR.

This module implements the WASM code generator as specified in the
CheerpX Integration Research report. It provides:
- SSA IR representation
- Instruction selection (IR op -> WASM opcode)
- Register allocation (virtual registers -> WASM locals)
- Text and binary WASM output

Classes:
    IROpcode: Enum of IR operation types
    IROperation: Single SSA IR operation
    IRBlock: Basic block of IR operations
    IRFunction: Function containing IR blocks
    WASMGenerator: Main code generator class
    RegisterAllocator: Linear scan register allocator
"""

import struct
from dataclasses import dataclass, field
from enum import IntEnum
from typing import List, Dict, Optional, Set, Tuple


# =============================================================================
# WASM Opcodes (Binary Format)
# =============================================================================

class WASMOpcode(IntEnum):
    """WebAssembly opcodes for binary encoding."""
    # Control flow
    UNREACHABLE = 0x00
    NOP = 0x01
    BLOCK = 0x02
    LOOP = 0x03
    IF = 0x04
    ELSE = 0x05
    END = 0x0b
    BR = 0x0c
    BR_IF = 0x0d
    BR_TABLE = 0x0e
    RETURN = 0x0f
    CALL = 0x10
    CALL_INDIRECT = 0x11

    # Parametric
    DROP = 0x1a
    SELECT = 0x1b

    # Variable access
    LOCAL_GET = 0x20
    LOCAL_SET = 0x21
    LOCAL_TEE = 0x22
    GLOBAL_GET = 0x23
    GLOBAL_SET = 0x24

    # Memory
    I32_LOAD = 0x28
    I64_LOAD = 0x29
    F32_LOAD = 0x2a
    F64_LOAD = 0x2b
    I32_LOAD8_S = 0x2c
    I32_LOAD8_U = 0x2d
    I32_LOAD16_S = 0x2e
    I32_LOAD16_U = 0x2f
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
    I32_STORE8 = 0x3a
    I32_STORE16 = 0x3b
    I64_STORE8 = 0x3c
    I64_STORE16 = 0x3d
    I64_STORE32 = 0x3e

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
    I32_GT_S = 0x4a
    I32_GT_U = 0x4b
    I32_LE_S = 0x4c
    I32_LE_U = 0x4d
    I32_GE_S = 0x4e
    I32_GE_U = 0x4f

    # Arithmetic
    I32_ADD = 0x6a
    I32_SUB = 0x6b
    I32_MUL = 0x6c
    I32_DIV_S = 0x6d
    I32_DIV_U = 0x6e
    I32_REM_S = 0x6f
    I32_REM_U = 0x70

    # Bitwise
    I32_AND = 0x71
    I32_OR = 0x72
    I32_XOR = 0x73
    I32_SHL = 0x74
    I32_SHR_U = 0x76
    I32_SHR_S = 0x75


# =============================================================================
# Intermediate Representation (SSA)
# =============================================================================

class IROpcode(IntEnum):
    """IR operation types for SSA representation."""
    # Constants
    CONST = 1
    # Arithmetic
    ADD = 2
    SUB = 3
    MUL = 4
    DIV_S = 5
    DIV_U = 6
    REM_S = 7
    REM_U = 8
    # Bitwise
    AND = 9
    OR = 10
    XOR = 11
    SHL = 12
    SHR_S = 13
    SHR_U = 14
    # Comparison
    EQ = 15
    NE = 16
    LT_S = 17
    LT_U = 18
    GT_S = 19
    GT_U = 20
    LE_S = 21
    LE_U = 22
    GE_S = 23
    GE_U = 24
    # Memory
    LOAD = 25
    STORE = 26
    # Control flow
    BR = 27
    BR_IF = 28
    CALL = 29
    RETURN = 30
    PHI = 31


@dataclass
class IROperation:
    """Single SSA IR operation.

    Attributes:
        opcode: The IR operation type
        result: Virtual register for result (SSA variable)
        operands: List of operand virtual registers or immediates
        block_id: Basic block ID (for PHI nodes)
    """
    opcode: IROpcode
    result: int
    operands: List[int] = field(default_factory=list)
    block_id: int = 0
    comment: str = ""

    def __str__(self) -> str:
        op_name = self.opcode.name
        if self.opcode == IROpcode.CONST:
            return f"v{self.result} = CONST {self.operands[0]}"
        elif self.opcode == IROpcode.PHI:
            ops = ", ".join(f"v{op}" for op in self.operands)
            return f"v{self.result} = PHI({self.block_id}, {ops})"
        else:
            ops = ", ".join(f"v{op}" for op in self.operands)
            return f"v{self.result} = {op_name} {ops}"


@dataclass
class IRBlock:
    """Basic block of IR operations.

    A basic block is a sequence of operations with a single entry point
    and single exit point (no branches in the middle).
    """
    id: int
    name: str
    operations: List[IROperation] = field(default_factory=list)
    predecessors: List[int] = field(default_factory=list)
    successors: List[int] = field(default_factory=list)

    def add_operation(self, op: IROperation) -> None:
        """Add an operation to this block."""
        self.operations.append(op)

    def __str__(self) -> str:
        lines = [f"block_{self.id}:"]
        for op in self.operations:
            lines.append(f"    {op}")
        return "\n".join(lines)


@dataclass
class IRFunction:
    """Function containing IR basic blocks.

    Attributes:
        name: Function name
        params: List of parameter virtual registers
        returns: Virtual register for return value (or None if void)
        blocks: List of basic blocks
        next_vreg: Counter for allocating new virtual registers
    """
    name: str
    params: List[int] = field(default_factory=list)
    returns: Optional[int] = None
    blocks: List[IRBlock] = field(default_factory=list)
    next_vreg: int = 0
    entry_block: int = 0

    def alloc_vreg(self) -> int:
        """Allocate a new virtual register."""
        reg = self.next_vreg
        self.next_vreg += 1
        return reg

    def add_block(self, name: str = "") -> IRBlock:
        """Add a new basic block and return it."""
        block_id = len(self.blocks)
        block = IRBlock(id=block_id, name=name or f"block_{block_id}")
        self.blocks.append(block)
        return block

    def add_param(self) -> int:
        """Add a parameter and return its virtual register."""
        vreg = self.alloc_vreg()
        self.params.append(vreg)
        return vreg

    def get_block(self, block_id: int) -> Optional[IRBlock]:
        """Get a block by ID."""
        if 0 <= block_id < len(self.blocks):
            return self.blocks[block_id]
        return None

    def __str__(self) -> str:
        lines = [f"function {self.name}({', '.join(f'v{p}' for p in self.params)})"]
        if self.returns is not None:
            lines.append(f"    -> v{self.returns}")
        lines.append("{")
        for block in self.blocks:
            lines.append(f"    {str(block).replace(chr(10), chr(10) + '    ')}")
        lines.append("}")
        return "\n".join(lines)


# =============================================================================
# Register Allocator (Linear Scan)
# =============================================================================

@dataclass
class LiveRange:
    """Live range for a virtual register."""
    vreg: int
    start: int
    end: int
    local_id: Optional[int] = None


class RegisterAllocator:
    """Simple linear scan register allocator.

    Maps virtual registers to WASM local indices using linear scan
    allocation algorithm. Sufficient for initial implementation.
    """

    def __init__(self):
        self.vreg_to_local: Dict[int, int] = {}
        self.local_count = 0
        self.live_ranges: List[LiveRange] = []

    def compute_live_ranges(self, func: IRFunction) -> List[LiveRange]:
        """Compute live ranges for all virtual registers."""
        # Track first and last use of each vreg
        first_use: Dict[int, int] = {}
        last_use: Dict[int, int] = {}

        instr_index = 0
        for block in func.blocks:
            for op in block.operations:
                # Result is defined here
                if op.result not in first_use:
                    first_use[op.result] = instr_index
                last_use[op.result] = instr_index

                # Operands are used here
                for operand in op.operands:
                    if operand not in first_use:
                        first_use[operand] = instr_index
                    last_use[operand] = instr_index

                instr_index += 1

        # Create live ranges
        ranges = []
        for vreg in sorted(first_use.keys()):
            ranges.append(LiveRange(
                vreg=vreg,
                start=first_use[vreg],
                end=last_use[vreg]
            ))

        # Sort by start position (for linear scan)
        ranges.sort(key=lambda r: r.start)
        return ranges

    def allocate(self, func: IRFunction) -> Dict[int, int]:
        """Allocate WASM locals for virtual registers.

        Returns:
            Mapping from virtual register to local index
        """
        self.live_ranges = self.compute_live_ranges(func)
        active: List[LiveRange] = []
        self.local_count = 0
        self.vreg_to_local = {}

        for lr in self.live_ranges:
            # Expire ranges that have ended
            active = [r for r in active if r.end > lr.start]

            # Allocate a new local
            self.vreg_to_local[lr.vreg] = self.local_count
            lr.local_id = self.local_count
            self.local_count += 1
            active.append(lr)

        return self.vreg_to_local


# =============================================================================
# WASM Generator
# =============================================================================

class WASMGenerator:
    """Generate WebAssembly from SSA IR.

    This class implements instruction selection, register allocation,
    and WASM text/binary format output.
    """

    def __init__(self):
        self.function: Optional[IRFunction] = None
        self.alloc = RegisterAllocator()
        self.vreg_to_local: Dict[int, int] = {}
        self.local_types: List[int] = []  # 0x7f for i32

    # IR op to WASM opcode mapping
    OPCODE_MAP: Dict[IROpcode, WASMOpcode] = {
        IROpcode.ADD: WASMOpcode.I32_ADD,
        IROpcode.SUB: WASMOpcode.I32_SUB,
        IROpcode.MUL: WASMOpcode.I32_MUL,
        IROpcode.DIV_S: WASMOpcode.I32_DIV_S,
        IROpcode.DIV_U: WASMOpcode.I32_DIV_U,
        IROpcode.AND: WASMOpcode.I32_AND,
        IROpcode.OR: WASMOpcode.I32_OR,
        IROpcode.XOR: WASMOpcode.I32_XOR,
        IROpcode.SHL: WASMOpcode.I32_SHL,
        IROpcode.SHR_S: WASMOpcode.I32_SHR_S,
        IROpcode.SHR_U: WASMOpcode.I32_SHR_U,
        IROpcode.EQ: WASMOpcode.I32_EQ,
        IROpcode.NE: WASMOpcode.I32_NE,
        IROpcode.LT_S: WASMOpcode.I32_LT_S,
        IROpcode.LT_U: WASMOpcode.I32_LT_U,
        IROpcode.GT_S: WASMOpcode.I32_GT_S,
        IROpcode.GT_U: WASMOpcode.I32_GT_U,
        IROpcode.LE_S: WASMOpcode.I32_LE_S,
        IROpcode.LE_U: WASMOpcode.I32_LE_U,
        IROpcode.GE_S: WASMOpcode.I32_GE_S,
        IROpcode.GE_U: WASMOpcode.I32_GE_U,
        IROpcode.LOAD: WASMOpcode.I32_LOAD,
        IROpcode.STORE: WASMOpcode.I32_STORE,
        IROpcode.BR: WASMOpcode.BR,
        IROpcode.BR_IF: WASMOpcode.BR_IF,
        IROpcode.CALL: WASMOpcode.CALL,
        IROpcode.RETURN: WASMOpcode.RETURN,
    }

    def consume(self, func: IRFunction) -> None:
        """Process IR function and prepare for code generation.

        Args:
            func: IRFunction to generate WASM from
        """
        self.function = func
        self.vreg_to_local = self.alloc.allocate(func)
        self.local_types = [0x7f] * self.alloc.local_count  # All i32 for now

    def emit_wasm_text(self) -> str:
        """Generate WASM text format (WAT).

        Returns:
            WASM text format string
        """
        if self.function is None:
            raise ValueError("No function loaded. Call consume() first.")

        lines = []
        func = self.function

        # Function signature - map param vregs to their allocated locals
        param_locals = [(self.vreg_to_local[p], f"i32") for p in func.params]
        params_str = " ".join(f"(param $local_{idx} {typ})" for idx, typ in param_locals)
        if func.returns is not None:
            result_str = "(result i32)"
        else:
            result_str = ""

        lines.append(f"(module")
        lines.append(f"  (func ${func.name} {params_str} {result_str}")

        # Local declarations (for non-parameter vregs)
        param_local_ids = set(idx for idx, _ in param_locals)
        for local_idx in range(self.alloc.local_count):
            if local_idx not in param_local_ids:
                lines.append(f"    (local $local_{local_idx} i32)")

        # Emit each block
        for block in func.blocks:
            if block.name:
                lines.append(f"    ;; {block.name}")
            for op in block.operations:
                lines.extend(self._emit_instruction_text(op))

        lines.append("  )")
        lines.append(")")

        return "\n".join(lines)

    def _emit_instruction_text(self, op: IROperation) -> List[str]:
        """Emit single instruction as WASM text format."""
        lines = []

        # Skip PHI nodes in text format (they're SSA-specific)
        if op.opcode == IROpcode.PHI:
            return lines

        if op.opcode == IROpcode.CONST:
            imm = op.operands[0]
            local = self.vreg_to_local.get(op.result, op.result)
            lines.append(f"    i32.const {imm}")
            lines.append(f"    local.set $local_{local}")

        elif op.opcode == IROpcode.LOAD:
            addr = self.vreg_to_local.get(op.operands[0], op.operands[0])
            local = self.vreg_to_local.get(op.result, op.result)
            lines.append(f"    local.get $local_{addr}")
            lines.append(f"    i32.load")
            lines.append(f"    local.set $local_{local}")

        elif op.opcode == IROpcode.STORE:
            addr = self.vreg_to_local.get(op.operands[0], op.operands[0])
            val = self.vreg_to_local.get(op.operands[1], op.operands[1])
            lines.append(f"    local.get $local_{addr}")
            lines.append(f"    local.get $local_{val}")
            lines.append(f"    i32.store")

        elif op.opcode == IROpcode.BR:
            lines.append(f"    br {op.operands[0]}")

        elif op.opcode == IROpcode.BR_IF:
            cond = self.vreg_to_local.get(op.operands[1], op.operands[1])
            lines.append(f"    local.get $local_{cond}")
            lines.append(f"    br_if {op.operands[0]}")

        elif op.opcode == IROpcode.CALL:
            # Push arguments
            for arg in op.operands[1:]:
                local = self.vreg_to_local.get(arg, arg)
                lines.append(f"    local.get $local_{local}")
            # Call
            target = op.operands[0]
            if isinstance(target, str):
                lines.append(f"    call ${target}")
            else:
                lines.append(f"    call ${target}")
            # Store result if needed
            if op.result >= 0:
                local = self.vreg_to_local.get(op.result, op.result)
                lines.append(f"    local.set $local_{local}")

        elif op.opcode == IROpcode.RETURN:
            if op.operands:
                val = self.vreg_to_local.get(op.operands[0], op.operands[0])
                lines.append(f"    local.get $local_{val}")
            lines.append(f"    return")

        else:
            # Binary operation
            wasm_op = self.OPCODE_MAP.get(op.opcode)
            if wasm_op:
                lhs = self.vreg_to_local.get(op.operands[0], op.operands[0])
                rhs = self.vreg_to_local.get(op.operands[1], op.operands[1])
                local = self.vreg_to_local.get(op.result, op.result)

                # Convert I32_LT_S -> i32.lt_s (not i32.lt.s)
                op_name = self._wasm_opcode_to_text(wasm_op)
                lines.append(f"    local.get $local_{lhs}")
                lines.append(f"    local.get $local_{rhs}")
                lines.append(f"    {op_name}")
                lines.append(f"    local.set $local_{local}")

        return lines

    def _wasm_opcode_to_text(self, opcode: WASMOpcode) -> str:
        """Convert WASMOpcode enum to WAT text format.

        Args:
            opcode: The WASM opcode enum value

        Returns:
            String representation in WAT format (e.g., "i32.add", "i32.lt_s")
        """
        name = opcode.name.lower()

        # Handle special cases for opcodes that need underscores
        # I32_LT_S -> i32.lt_s (not i32.lt.s)
        # I32_DIV_S -> i32.div_s
        # Pattern: I32_[A-Z]+_[SU] -> i32.<op>_<s|u>
        if name.startswith("i32_") or name.startswith("i64_") or name.startswith("f32_") or name.startswith("f64_"):
            parts = name.split("_")
            # parts: ["i32", "lt", "s"] or ["i32", "add"]
            if len(parts) >= 2:
                base = parts[0]  # "i32"
                op = parts[1]    # "lt" or "add" or "div"
                suffix = parts[2] if len(parts) > 2 else ""  # "s" or "u" or ""
                return f"{base}.{op}{f'_{suffix}' if suffix else ''}"

        return name

    def emit_wasm_binary(self) -> bytes:
        """Generate WASM binary format (.was).

        Returns:
            WASM binary bytecode
        """
        if self.function is None:
            raise ValueError("No function loaded. Call consume() first.")

        func = self.function

        # Build binary sections
        sections = []

        # 1. Type section
        type_section = self._build_type_section(func)
        sections.append((1, type_section))

        # 2. Function section
        func_section = self._build_function_section(func)
        sections.append((3, func_section))

        # 3. Export section
        export_section = self._build_export_section(func)
        sections.append((7, export_section))

        # 4. Code section
        code_section = self._build_code_section(func)
        sections.append((10, code_section))

        # Build complete module
        wasm = b"\x00asm\x01\x00\x00\x00"  # Magic + version

        for section_id, section_data in sections:
            wasm += bytes([section_id])
            wasm += self._encode_u32(len(section_data))
            wasm += section_data

        return wasm

    def _build_type_section(self, func: IRFunction) -> bytes:
        """Build type section for function signature."""
        # Function type: [params*] -> [result?]
        type_section = b"\x01"  # 1 type

        params = func.params
        param_count = len(params)
        result_count = 1 if func.returns is not None else 0

        type_section += b"\x60"  # func type
        type_section += bytes([param_count])  # num params
        type_section += b"\x7f" * param_count  # all i32
        type_section += bytes([result_count])  # num results
        if result_count:
            type_section += b"\x7f"  # i32 result

        return type_section

    def _build_function_section(self, func: IRFunction) -> bytes:
        """Build function section."""
        return b"\x01\x00"  # 1 function, type index 0

    def _build_export_section(self, func: IRFunction) -> bytes:
        """Build export section."""
        name = func.name.encode("utf-8")
        return bytes([len(name)]) + name + b"\x00\x00"  # name, kind=func, index=0

    def _build_code_section(self, func: IRFunction) -> bytes:
        """Build code section with function body."""
        body = b""

        # Locals declaration
        param_locals = set(self.vreg_to_local[p] for p in func.params)
        non_param_locals = [
            i for i in range(self.alloc.local_count)
            if i not in param_locals
        ]

        body += bytes([len(non_param_locals)])  # num local groups
        if non_param_locals:
            body += bytes([1])  # group size
            body += bytes([0x7f])  # i32 type

        # Emit instructions
        for block in func.blocks:
            for op in block.operations:
                body += self._emit_instruction_binary(op)

        # End of function
        body += b"\x0b"

        return bytes([len(body)]) + body

    def _emit_instruction_binary(self, op: IROperation) -> bytes:
        """Emit single instruction as WASM binary."""
        code = b""

        # Skip PHI nodes
        if op.opcode == IROpcode.PHI:
            return code

        if op.opcode == IROpcode.CONST:
            imm = op.operands[0]
            local = self.vreg_to_local.get(op.result, op.result)
            code += bytes([WASMOpcode.I32_CONST]) + self._encode_i32(imm)
            code += bytes([WASMOpcode.LOCAL_SET, local])

        elif op.opcode == IROpcode.LOAD:
            addr = self.vreg_to_local.get(op.operands[0], op.operands[0])
            local = self.vreg_to_local.get(op.result, op.result)
            code += bytes([WASMOpcode.LOCAL_GET, addr])
            code += bytes([WASMOpcode.I32_LOAD, 0x00])  # offset=0, align=0
            code += bytes([WASMOpcode.LOCAL_SET, local])

        elif op.opcode == IROpcode.STORE:
            addr = self.vreg_to_local.get(op.operands[0], op.operands[0])
            val = self.vreg_to_local.get(op.operands[1], op.operands[1])
            code += bytes([WASMOpcode.LOCAL_GET, addr])
            code += bytes([WASMOpcode.LOCAL_GET, val])
            code += bytes([WASMOpcode.I32_STORE, 0x00])  # offset=0, align=0

        elif op.opcode == IROpcode.BR:
            depth = op.operands[0]
            code += bytes([WASMOpcode.BR, depth])

        elif op.opcode == IROpcode.BR_IF:
            depth = op.operands[0]
            cond = self.vreg_to_local.get(op.operands[1], op.operands[1])
            code += bytes([WASMOpcode.LOCAL_GET, cond])
            code += bytes([WASMOpcode.BR_IF, depth])

        elif op.opcode == IROpcode.CALL:
            # Push arguments
            for arg in op.operands[1:]:
                local = self.vreg_to_local.get(arg, arg)
                code += bytes([WASMOpcode.LOCAL_GET, local])
            # Call
            code += bytes([WASMOpcode.CALL, op.operands[0]])
            # Store result if needed
            if op.result >= 0:
                local = self.vreg_to_local.get(op.result, op.result)
                code += bytes([WASMOpcode.LOCAL_SET, local])

        elif op.opcode == IROpcode.RETURN:
            if op.operands:
                val = self.vreg_to_local.get(op.operands[0], op.operands[0])
                code += bytes([WASMOpcode.LOCAL_GET, val])
            code += bytes([WASMOpcode.RETURN])

        else:
            # Binary operation
            wasm_op = self.OPCODE_MAP.get(op.opcode)
            if wasm_op:
                lhs = self.vreg_to_local.get(op.operands[0], op.operands[0])
                rhs = self.vreg_to_local.get(op.operands[1], op.operands[1])
                local = self.vreg_to_local.get(op.result, op.result)

                code += bytes([WASMOpcode.LOCAL_GET, lhs])
                code += bytes([WASMOpcode.LOCAL_GET, rhs])
                code += bytes([wasm_op])
                code += bytes([WASMOpcode.LOCAL_SET, local])

        return code

    @staticmethod
    def _encode_u32(value: int) -> bytes:
        """Encode unsigned 32-bit integer using LEB128."""
        if value < 0:
            raise ValueError("Cannot encode negative value as unsigned")

        result = b""
        while True:
            byte = value & 0x7f
            value >>= 7
            if value:
                result += bytes([byte | 0x80])
            else:
                result += bytes([byte])
                break
        return result

    @staticmethod
    def _encode_i32(value: int) -> bytes:
        """Encode signed 32-bit integer using LEB128."""
        result = b""
        while True:
            byte = value & 0x7f
            value >>= 7
            if (value == 0 and not (byte & 0x40)) or (value == -1 and (byte & 0x40)):
                result += bytes([byte])
                break
            else:
                result += bytes([byte | 0x80])
        return result


# =============================================================================
# Convenience Functions
# =============================================================================

def create_simple_function(name: str, param_count: int) -> IRFunction:
    """Create a simple IR function for testing.

    Args:
        name: Function name
        param_count: Number of parameters

    Returns:
        IRFunction with parameters allocated
    """
    func = IRFunction(name=name)
    for _ in range(param_count):
        func.add_param()
    func.add_block(name="entry")
    return func


def generate_fibonacci_ir() -> IRFunction:
    """Generate a simple Fibonacci IR function for testing.

    Returns:
        IRFunction implementing fibonacci(n)
    """
    func = IRFunction(name="fibonacci")
    n = func.add_param()  # v0 = n

    entry = func.add_block(name="entry")

    # Base case: if n <= 1, return n
    one_vreg = func.alloc_vreg()
    entry.add_operation(IROperation(IROpcode.CONST, one_vreg, [1]))

    le_vreg = func.alloc_vreg()
    entry.add_operation(IROperation(IROpcode.LE_U, le_vreg, [n, one_vreg]))

    # For simplicity, just return n for now (no branching yet)
    func.returns = n
    entry.add_operation(IROperation(IROpcode.RETURN, -1, [n]))

    return func


def generate_add_function() -> IRFunction:
    """Generate a simple add(a, b) function.

    Returns:
        IRFunction implementing add(a, b) -> a + b
    """
    func = IRFunction(name="add")
    a = func.add_param()  # v0 = a
    b = func.add_param()  # v1 = b

    entry = func.add_block(name="entry")

    # result = a + b
    result = func.alloc_vreg()  # v2
    entry.add_operation(IROperation(IROpcode.ADD, result, [a, b]))

    # return result
    func.returns = result
    entry.add_operation(IROperation(IROpcode.RETURN, -1, [result]))

    return func

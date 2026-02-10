"""
Stack Operation Translator for x86 to WASM Binary Translation

This module translates x86_64 stack operations (PUSH, POP) to equivalent
WASM memory operations, tracking the stack pointer (RSP) and handling
16-byte alignment requirements per the x86_64 ABI.

Architecture:
- RSP (Stack Pointer) is tracked as a WASM global or memory offset
- Stack grows downward (decreasing addresses)
- 16-byte alignment is maintained before function calls

Key Mappings:
- PUSH reg  -> i32.store offset=0, value=reg; RSP -= 8
- POP reg   -> RSP += 8; reg = i32.load offset=-8
- SUB RSP,N -> RSP -= N (with alignment padding)
"""

from dataclasses import dataclass, field
from typing import List, Optional, Dict, Tuple
from enum import Enum
import struct


class X86Register(Enum):
    """x86_64 general-purpose registers."""
    RAX = "rax"
    RBX = "rbx"
    RCX = "rcx"
    RDX = "rdx"
    RSI = "rsi"
    RDI = "rdi"
    RBP = "rbp"
    RSP = "rsp"
    R8 = "r8"
    R9 = "r9"
    R10 = "r10"
    R11 = "r11"
    R12 = "r12"
    R13 = "r13"
    R14 = "r14"
    R15 = "r15"


class StackAlignment(Enum):
    """Stack alignment modes."""
    NONE = 0      # No alignment
    ALIGN_8 = 8   # 8-byte alignment
    ALIGN_16 = 16 # 16-byte alignment (x86_64 ABI)


@dataclass
class StackInstruction:
    """Represents a translated WASM instruction."""
    opcode: bytes
    operands: bytes = b''
    comment: str = ''

    def to_bytes(self) -> bytes:
        """Convert to WASM bytecode."""
        return self.opcode + self.operands

    def __str__(self) -> str:
        """Return assembly-like representation."""
        if self.comment:
            return f"{self.opcode.hex()} {self.operands.hex()} ; {self.comment}"
        return f"{self.opcode.hex()} {self.operands.hex()}"


@dataclass
class StackFrame:
    """Represents a stack frame with tracking info."""
    base_offset: int      # Base offset in WASM memory
    size: int = 0         # Current frame size in bytes
    alignment: int = 16   # Alignment requirement
    saved_regs: List[X86Register] = field(default_factory=list)
    local_size: int = 0   # Size for local variables

    def aligned_size(self) -> int:
        """Return size aligned to alignment boundary."""
        return (self.size + self.alignment - 1) // self.alignment * self.alignment


@dataclass
class TranslationResult:
    """Result of stack operation translation."""
    instructions: List[StackInstruction] = field(default_factory=list)
    stack_delta: int = 0  # Change in stack pointer
    new_rsp: int = 0      # New RSP value
    alignment_needed: bool = False

    def to_wasm_bytes(self) -> bytes:
        """Convert all instructions to WASM bytecode."""
        return b''.join(inst.to_bytes() for inst in self.instructions)

    def append(self, other: 'TranslationResult') -> None:
        """Append another result to this one."""
        self.instructions.extend(other.instructions)
        self.stack_delta += other.stack_delta
        self.new_rsp = other.new_rsp
        self.alignment_needed = self.alignment_needed or other.alignment_needed


class StackTranslator:
    """
    Translates x86_64 stack operations to WASM memory operations.

    The stack is modeled as a region in WASM linear memory with:
    - A global or memory-mapped RSP value
    - Downward growth (decreasing addresses)
    - 16-byte alignment per x86_64 ABI

    Usage:
        translator = StackTranslator()

        # Translate PUSH RAX
        result = translator.translate_push(X86Register.RAX, rsp_value=0x1000)
        wasm_bytes = result.to_wasm_bytes()

        # Translate function prologue
        result = translator.translate_prologue(rsp_value=0x1000)
    """

    # WASM opcodes (encoded)
    OP_I32_CONST = b'\x41'       # i32.const
    OP_I64_CONST = b'\x42'       # i64.const
    OP_I32_LOAD = b'\x28'        # i32.load
    OP_I32_STORE = b'\x36'       # i32.store
    OP_I64_LOAD = b'\x29'        # i64.load
    OP_I64_STORE = b'\x37'       # i64.store
    OP_I32_ADD = b'\x6a'         # i32.add
    OP_I32_SUB = b'\x6b'         # i32.sub
    OP_GLOBAL_GET = b'\x23'      # global.get
    OP_GLOBAL_SET = b'\x24'      # global.set
    OP_END = b'\x0b'             # end
    OP_DROP = b'\x1a'            # drop

    # Default stack location in WASM memory
    DEFAULT_STACK_BASE = 0x10000  # 64KB stack base
    STACK_SIZE = 0x10000         # 64KB stack size

    def __init__(
        self,
        stack_base: int = DEFAULT_STACK_BASE,
        stack_size: int = STACK_SIZE,
        alignment: StackAlignment = StackAlignment.ALIGN_16,
        use_globals: bool = True
    ):
        """
        Initialize the stack translator.

        Args:
            stack_base: Base address of stack in WASM linear memory
            stack_size: Maximum stack size in bytes
            alignment: Stack alignment requirement
            use_globals: If True, use WASM globals for RSP. If False, use memory.
        """
        self.stack_base = stack_base
        self.stack_size = stack_size
        self.alignment = alignment.value
        self.use_globals = use_globals

        # RSP is tracked as a global index (default: global 0 for RSP)
        self.rsp_global_index = 0

        # Stack frame tracking
        self.frames: List[StackFrame] = []
        self.current_frame: Optional[StackFrame] = None

    def translate_push(
        self,
        register: X86Register,
        rsp_value: int,
        register_values: Optional[Dict[X86Register, int]] = None
    ) -> TranslationResult:
        """
        Translate x86 PUSH instruction to WASM.

        x86: PUSH RAX
        WASM equivalent:
            global.get 0        ; get RSP
            i32.const 8
            i32.sub
            local.tee 0         ; new RSP
            global.set 0        ; update RSP
            global.get 0        ; get new RSP
            local.get <reg>     ; get register value
            i32.store           ; store to stack

        Args:
            register: Register to push
            rsp_value: Current stack pointer value
            register_values: Optional dict of current register values

        Returns:
            TranslationResult with WASM instructions
        """
        result = TranslationResult(
            stack_delta=-8,
            new_rsp=rsp_value - 8
        )

        # Calculate new RSP
        new_rsp = rsp_value - 8

        # Align if needed
        if self.alignment == 16:
            aligned_rsp = (new_rsp // 16) * 16
            if aligned_rsp != new_rsp:
                result.alignment_needed = True

        # Generate WASM instructions
        # 1. Get current RSP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment=f"get RSP (0x{rsp_value:x})"
        ))

        # 2. Subtract 8
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_CONST,
            operands=self._signed_leb128(8),
            comment="stack slot size"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_ADD,
            comment="decrement by 8 (WASM grows up, we map to negative)"
        ))

        # 3. Update RSP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([self.rsp_global_index]),
            comment=f"update RSP to 0x{new_rsp:x}"
        ))

        # 4. Get register value (as a placeholder - actual value comes from register file)
        # In practice, this would be a local.get or global.get
        if register_values and register in register_values:
            reg_val = register_values[register]
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_CONST,
                operands=self._signed_leb128(reg_val),
                comment=f"value of {register.value}"
            ))
        else:
            # Placeholder: load from register mapping
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_CONST,
                operands=self._signed_leb128(0),
                comment=f"value of {register.value} (placeholder)"
            ))

        # 5. Store to stack
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_STORE,
            operands=b'\x00' + bytes([0, 0]),  # align=0, offset=0
            comment=f"PUSH {register.value}"
        ))

        return result

    def translate_pop(
        self,
        register: X86Register,
        rsp_value: int
    ) -> TranslationResult:
        """
        Translate x86 POP instruction to WASM.

        x86: POP RAX
        WASM equivalent:
            global.get 0        ; get RSP
            local.tee 0         ; save RSP
            i32.load            ; load from stack
            local.set <reg>     ; store to register
            local.get 0
            i32.const 8
            i32.add
            global.set 0        ; update RSP

        Args:
            register: Register to pop into
            rsp_value: Current stack pointer value

        Returns:
            TranslationResult with WASM instructions
        """
        result = TranslationResult(
            stack_delta=8,
            new_rsp=rsp_value + 8
        )

        # 1. Get current RSP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment=f"get RSP (0x{rsp_value:x})"
        ))

        # 2. Load from stack
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_LOAD,
            operands=b'\x00' + bytes([0, 0]),  # align=0, offset=0
            comment=f"load value for {register.value}"
        ))

        # 3. Store to register (placeholder - would be local.set in practice)
        result.instructions.append(StackInstruction(
            opcode=self.OP_DROP,
            comment=f"POP {register.value} (placeholder)"
        ))

        # 4. Increment RSP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment="get RSP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_CONST,
            operands=self._signed_leb128(8),
            comment="stack slot size"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_ADD,
            comment="increment by 8"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([self.rsp_global_index]),
            comment=f"update RSP to 0x{rsp_value + 8:x}"
        ))

        return result

    def translate_prologue(
        self,
        rsp_value: int,
        frame_size: int = 0,
        saved_regs: Optional[List[X86Register]] = None
    ) -> TranslationResult:
        """
        Translate function prologue (PUSH RBP; MOV RBP, RSP; optionally SUB RSP, N).

        x86 standard prologue:
            push rbp
            mov rbp, rsp
            sub rsp, N           ; if locals needed

        WASM equivalent:
            ; Save old RBP
            global.get 0         ; get RSP
            i32.const 8
            i32.sub
            global.set 0         ; RSP -= 8
            global.get 0         ; get new RSP
            global.get 1         ; get RBP
            i32.store            ; save RBP to stack
            ; Set RBP = RSP
            global.get 0         ; get RSP
            global.set 1         ; RBP = RSP
            ; Allocate locals if needed
            global.get 0         ; get RSP
            i32.const N
            i32.sub
            global.set 0         ; RSP -= N

        Args:
            rsp_value: Current stack pointer value
            frame_size: Size for local variables (must be multiple of 16)
            saved_regs: Optional list of registers to save

        Returns:
            TranslationResult with WASM instructions
        """
        result = TranslationResult()
        saved_regs = saved_regs or []

        # RBP is tracked in global 1
        rbp_global_index = 1

        # 1. PUSH RBP
        push_result = self.translate_push(X86Register.RBP, rsp_value)
        result.append(push_result)
        current_rsp = push_result.new_rsp

        # 2. MOV RBP, RSP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment="get RSP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([rbp_global_index]),
            comment="RBP = RSP"
        ))

        # 3. Save additional registers if specified
        for reg in saved_regs:
            push_result = self.translate_push(reg, current_rsp)
            result.append(push_result)
            current_rsp = push_result.new_rsp

        # 4. SUB RSP, N (allocate locals)
        if frame_size > 0:
            # Align to 16 bytes
            aligned_frame = (frame_size + 15) // 16 * 16

            result.instructions.append(StackInstruction(
                opcode=self.OP_GLOBAL_GET,
                operands=bytes([self.rsp_global_index]),
                comment=f"get RSP for local allocation ({aligned_frame} bytes)"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_CONST,
                operands=self._signed_leb128(aligned_frame),
                comment="frame size"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_SUB,
                comment="allocate space for locals"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_GLOBAL_SET,
                operands=bytes([self.rsp_global_index]),
                comment=f"RSP -= {aligned_frame}"
            ))

            current_rsp -= aligned_frame

        # Update result metadata
        result.stack_delta = current_rsp - rsp_value
        result.new_rsp = current_rsp

        # Create stack frame tracking
        self.current_frame = StackFrame(
            base_offset=rsp_value,
            size=abs(result.stack_delta),
            alignment=self.alignment,
            saved_regs=[X86Register.RBP] + saved_regs,
            local_size=frame_size
        )
        self.frames.append(self.current_frame)

        return result

    def translate_epilogue(
        self,
        rsp_value: int,
        saved_regs: Optional[List[X86Register]] = None
    ) -> TranslationResult:
        """
        Translate function epilogue ( optionally ADD RSP, N; POP RBP; RET).

        x86 standard epilogue:
            add rsp, N           ; if locals were allocated
            pop rbp
            ret

        WASM equivalent:
            ; Deallocate locals
            global.get 0         ; get RSP
            i32.const N
            i32.add
            global.set 0         ; RSP += N
            ; Restore saved registers
            ... (POP sequences)
            ; Restore RBP
            global.get 0         ; get RSP
            i32.load
            global.set 1         ; RBP = [RSP]
            global.get 0         ; get RSP
            i32.const 8
            i32.add
            global.set 0         ; RSP += 8

        Args:
            rsp_value: Current stack pointer value
            saved_regs: Optional list of registers to restore (reverse order)

        Returns:
            TranslationResult with WASM instructions
        """
        result = TranslationResult()
        saved_regs = saved_regs or []

        # Get current frame info if available
        if self.frames:
            frame = self.frames.pop()
            local_size = frame.local_size
            saved_regs = frame.saved_regs if not saved_regs else saved_regs
        else:
            local_size = 0

        # 1. ADD RSP, N (deallocate locals)
        if local_size > 0:
            aligned_frame = (local_size + 15) // 16 * 16
            result.instructions.append(StackInstruction(
                opcode=self.OP_GLOBAL_GET,
                operands=bytes([self.rsp_global_index]),
                comment=f"get RSP to deallocate locals ({aligned_frame} bytes)"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_CONST,
                operands=self._signed_leb128(aligned_frame),
                comment="frame size"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_I32_ADD,
                comment="deallocate space for locals"
            ))
            result.instructions.append(StackInstruction(
                opcode=self.OP_GLOBAL_SET,
                operands=bytes([self.rsp_global_index]),
                comment=f"RSP += {aligned_frame}"
            ))

        # 2. Restore saved registers in reverse order
        current_rsp = rsp_value
        if local_size > 0:
            aligned_frame = (local_size + 15) // 16 * 16
            current_rsp += aligned_frame

        # Skip RBP in the list (we handle it separately)
        regs_to_restore = [r for r in reversed(saved_regs) if r != X86Register.RBP]

        for reg in regs_to_restore:
            pop_result = self.translate_pop(reg, current_rsp)
            result.append(pop_result)
            current_rsp = pop_result.new_rsp

        # 3. POP RBP
        rbp_global_index = 1
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment="get RSP for RBP restore"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_LOAD,
            operands=b'\x00' + bytes([0, 0]),
            comment="load saved RBP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([rbp_global_index]),
            comment="restore RBP"
        ))

        # Increment RSP after popping RBP
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment="get RSP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_CONST,
            operands=self._signed_leb128(8),
            comment="8 bytes for RBP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_ADD,
            comment="increment RSP"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([self.rsp_global_index]),
            comment="update RSP"
        ))

        current_rsp += 8

        # Update result metadata
        result.stack_delta = current_rsp - rsp_value
        result.new_rsp = current_rsp

        return result

    def translate_allocate(
        self,
        size: int,
        rsp_value: int
    ) -> TranslationResult:
        """
        Translate stack allocation (SUB RSP, N).

        x86: SUB RSP, N
        WASM equivalent:
            global.get 0         ; get RSP
            i32.const <aligned_size>
            i32.sub
            global.set 0         ; RSP -= aligned_size

        Args:
            size: Bytes to allocate (will be aligned)
            rsp_value: Current stack pointer value

        Returns:
            TranslationResult with WASM instructions
        """
        # Align size to 16 bytes per x86_64 ABI
        aligned_size = (size + 15) // 16 * 16

        result = TranslationResult(
            stack_delta=-aligned_size,
            new_rsp=rsp_value - aligned_size
        )

        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment=f"get RSP to allocate {aligned_size} bytes"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_CONST,
            operands=self._signed_leb128(aligned_size),
            comment=f"aligned size (was {size})"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_SUB,
            comment="allocate stack space"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([self.rsp_global_index]),
            comment=f"RSP -= {aligned_size}"
        ))

        return result

    def translate_deallocate(
        self,
        size: int,
        rsp_value: int
    ) -> TranslationResult:
        """
        Translate stack deallocation (ADD RSP, N).

        x86: ADD RSP, N
        WASM equivalent:
            global.get 0         ; get RSP
            i32.const <aligned_size>
            i32.add
            global.set 0         ; RSP += aligned_size

        Args:
            size: Bytes to deallocate (should match original allocation)
            rsp_value: Current stack pointer value

        Returns:
            TranslationResult with WASM instructions
        """
        # Align size to 16 bytes per x86_64 ABI
        aligned_size = (size + 15) // 16 * 16

        result = TranslationResult(
            stack_delta=aligned_size,
            new_rsp=rsp_value + aligned_size
        )

        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_GET,
            operands=bytes([self.rsp_global_index]),
            comment=f"get RSP to deallocate {aligned_size} bytes"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_CONST,
            operands=self._signed_leb128(aligned_size),
            comment=f"aligned size (was {size})"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_I32_ADD,
            comment="deallocate stack space"
        ))
        result.instructions.append(StackInstruction(
            opcode=self.OP_GLOBAL_SET,
            operands=bytes([self.rsp_global_index]),
            comment=f"RSP += {aligned_size}"
        ))

        return result

    def _signed_leb128(self, value: int) -> bytes:
        """
        Encode an integer as signed LEB128 (used by WASM).

        Args:
            value: Integer value to encode

        Returns:
            LEB128 encoded bytes
        """
        if value == 0:
            return b'\x00'

        result = bytearray()
        remaining = value

        more = True
        while more:
            byte = remaining & 0x7f
            remaining >>= 7

            # Sign bit check for last byte
            # For negative numbers, remaining becomes -1 after arithmetic shift
            # For positive numbers, remaining becomes 0
            if (remaining == 0 and (byte & 0x40) == 0) or \
               (remaining == -1 and (byte & 0x40) != 0):
                more = False
            else:
                byte |= 0x80

            result.append(byte)

        return bytes(result)

    def get_stack_depth(self) -> int:
        """Get current stack depth based on active frames."""
        return sum(f.size for f in self.frames)

    def reset(self) -> None:
        """Reset translator state (clear frames)."""
        self.frames.clear()
        self.current_frame = None


def create_push_wasm(register: X86Register, value: int = 0) -> bytes:
    """
    Convenience function to create a minimal PUSH sequence.

    Args:
        register: Register being pushed
        value: Value to push (for testing)

    Returns:
        WASM bytecode for PUSH operation
    """
    translator = StackTranslator()
    result = translator.translate_push(register, 0x1000, {register: value})
    return result.to_wasm_bytes()


def create_pop_wasm(register: X86Register) -> bytes:
    """
    Convenience function to create a minimal POP sequence.

    Args:
        register: Register being popped

    Returns:
        WASM bytecode for POP operation
    """
    translator = StackTranslator()
    result = translator.translate_pop(register, 0x1000)
    return result.to_wasm_bytes()


if __name__ == "__main__":
    # Demo: Create a simple function prologue/epilogue
    translator = StackTranslator()

    print("=== Function Prologue ===")
    prologue = translator.translate_prologue(
        rsp_value=0x10000,
        frame_size=32,
        saved_regs=[X86Register.RBX, X86Register.R12]
    )

    for i, inst in enumerate(prologue.instructions):
        print(f"{i:2d}: {inst}")

    print(f"\nStack delta: {prologue.stack_delta} bytes")
    print(f"New RSP: 0x{prologue.new_rsp:04x}")

    print("\n=== Function Epilogue ===")
    translator.reset()
    epilogue = translator.translate_epilogue(
        rsp_value=0x10000 - 32 - 24,  # Account for pushes and allocation
        saved_regs=[X86Register.RBX, X86Register.R12]
    )

    for i, inst in enumerate(epilogue.instructions):
        print(f"{i:2d}: {inst}")

    print(f"\nStack delta: {epilogue.stack_delta} bytes")
    print(f"New RSP: 0x{epilogue.new_rsp:04x}")

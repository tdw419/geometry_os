"""
GeoASM Opcode Constants

Maps visual symbols to WebAssembly-style opcodes for the Geometric Assembly processor.
These opcodes match the visual_cpu.wgsl shader implementation.
"""

# Opcode constants (hex values matching visual_cpu.wgsl)
OP_NOP = 0x01        # No operation
OP_BLOCK = 0x02      # Block start
OP_LOOP = 0x03       # Loop start
OP_LOCAL_GET = 0x20  # Load from local memory
OP_LOCAL_SET = 0x21  # Store to local memory
OP_DROP = 0x1A       # Drop top of stack
OP_CALL = 0x10       # Call function
OP_I32_EQZ = 0x45    # Compare to zero (i32)
OP_I32_CONST = 0x41  # Push immediate i32 constant
OP_I32_ADD = 0x6A    # Integer add
OP_I32_SUB = 0x6B    # Integer subtract
OP_I32_MUL = 0x6C    # Integer multiply

# Symbol to opcode mapping
# Maps ASCII symbols to their corresponding opcodes
SYMBOL_TO_OPCODE = {
    '$': OP_I32_CONST,   # Push immediate
    '+': OP_I32_ADD,     # Add
    '-': OP_I32_SUB,     # Subtract
    '*': OP_I32_MUL,     # Multiply
    '<': OP_LOCAL_GET,   # Load from memory
    '>': OP_LOCAL_SET,   # Store to memory
    '#': OP_NOP,         # No operation
    '!': OP_CALL,        # Call function
    '?': OP_I32_EQZ,     # Compare to zero
    '@': OP_BLOCK,       # Block start
    '~': OP_LOOP,        # Loop start
    '.': OP_DROP,        # Drop top of stack
}

# Reverse mapping: opcode to symbol
OPCODE_TO_SYMBOL = {v: k for k, v in SYMBOL_TO_OPCODE.items()}

# Human-readable opcode names for debugging
OPCODE_NAMES = {
    OP_NOP: "nop",
    OP_BLOCK: "block",
    OP_LOOP: "loop",
    OP_LOCAL_GET: "local.get",
    OP_LOCAL_SET: "local.set",
    OP_DROP: "drop",
    OP_CALL: "call",
    OP_I32_EQZ: "i32.eqz",
    OP_I32_CONST: "i32.const",
    OP_I32_ADD: "i32.add",
    OP_I32_SUB: "i32.sub",
    OP_I32_MUL: "i32.mul",
}

# Symbol descriptions for documentation
SYMBOL_DESCRIPTIONS = {
    '$': "Push immediate constant onto stack",
    '+': "Add top two stack values",
    '-': "Subtract top two stack values",
    '*': "Multiply top two stack values",
    '<': "Load value from local memory",
    '>': "Store value to local memory",
    '#': "No operation (nop)",
    '!': "Call function",
    '?': "Compare top of stack to zero",
    '@': "Begin block scope",
    '~': "Begin loop scope",
    '.': "Drop top of stack",
}


def get_opcode_name(opcode: int) -> str:
    """Get human-readable name for an opcode."""
    return OPCODE_NAMES.get(opcode, f"unknown(0x{opcode:02X})")


def symbol_to_opcode(symbol: str) -> int | None:
    """Convert a symbol character to its opcode value."""
    return SYMBOL_TO_OPCODE.get(symbol)


def opcode_to_symbol(opcode: int) -> str | None:
    """Convert an opcode value to its symbol character."""
    return OPCODE_TO_SYMBOL.get(opcode)

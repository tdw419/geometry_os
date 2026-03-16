#!/usr/bin/env python3
"""
Create a minimal WASM binary with host function imports.

This WASM:
1. Imports poke(i32, i32) from "env"
2. Imports peek(i32) -> i32 from "env"
3. Has _start function that:
   - Calls poke(0x1000, 42)
   - Calls val = peek(0x1000)
   - Calls poke(0x1004, val)
"""

import struct

def leb128_u(n):
    """Encode unsigned LEB128"""
    result = []
    while True:
        byte = n & 0x7F
        n >>= 7
        if n != 0:
            byte |= 0x80
        result.append(byte)
        if n == 0:
            break
    return bytes(result)

def name(s):
    """Encode a WASM name (length-prefixed)"""
    encoded = s.encode('utf-8')
    return leb128_u(len(encoded)) + encoded

def section(id, content):
    """Create a WASM section"""
    return bytes([id]) + leb128_u(len(content)) + content

# WASM magic and version
magic = b'\x00asm'
version = struct.pack('<I', 1)

# Type section (id=1)
# Type 0: (i32, i32) -> void  (for poke)
# Type 1: (i32) -> i32       (for peek)
type_section_content = (
    leb128_u(2) +  # 2 types
    bytes([0x60, 0x02, 0x7F, 0x7F, 0x00]) +  # (i32, i32) -> void
    bytes([0x60, 0x01, 0x7F, 0x01, 0x7F])    # (i32) -> i32
)
type_section = section(1, type_section_content)

# Import section (id=2)
# WASM import format: module_name, field_name, import_kind, import_descriptor
# Import 0: env.poke (func, type 0)
# Import 1: env.peek (func, type 1)
import_section_content = (
    leb128_u(2) +  # 2 imports
    # Import 0: env.poke
    name("env") +      # module name
    name("poke") +     # field name
    bytes([0x00]) +    # import kind: 0 = function
    leb128_u(0) +      # type index 0
    # Import 1: env.peek
    name("env") +      # module name
    name("peek") +     # field name
    bytes([0x00]) +    # import kind: 0 = function
    leb128_u(1)        # type index 1
)
import_section = section(2, import_section_content)

# Function section (id=3) - declares that function 2 uses type 0
# Function 2 (_start) has no parameters and no return, but we need a type for it
# Actually, let's add a type for _start: () -> void
# Let me recalculate...

# Actually, we need:
# Type 0: (i32, i32) -> void  (for poke)
# Type 1: (i32) -> i32       (for peek)
# Type 2: () -> void         (for _start)

# Redo type section with 3 types
type_section_content = (
    leb128_u(3) +  # 3 types
    bytes([0x60, 0x02, 0x7F, 0x7F, 0x00]) +  # Type 0: (i32, i32) -> void
    bytes([0x60, 0x01, 0x7F, 0x01, 0x7F]) +  # Type 1: (i32) -> i32
    bytes([0x60, 0x00, 0x00])                 # Type 2: () -> void
)
type_section = section(1, type_section_content)

# Function section (id=3) - type indices for local functions
# Function 2 (_start) uses type 2
func_section_content = (
    leb128_u(1) +   # 1 function
    leb128_u(2)     # function 2 uses type 2
)
func_section = section(3, func_section_content)

# Memory section (id=5)
# 1 page of memory
memory_section_content = (
    leb128_u(1) +  # 1 memory
    bytes([0x00, 0x01])  # limits: min=1, no max
)
memory_section = section(5, memory_section_content)

# Export section (id=7)
# Export _start as function 2
export_section_content = (
    leb128_u(1) +  # 1 export
    name("_start") + bytes([0x00]) + leb128_u(2)  # func index 2
)
export_section = section(7, export_section_content)

# Start section (id=8) - marks function 2 as start
start_section_content = leb128_u(2)  # function index 2
start_section = section(8, start_section_content)

# Code section (id=10)
# Function 2 (_start): calls poke(0x1000, 42), peek(0x1000), poke(0x1004, result)
#
# Locals: 1 i32 local (for storing peek result)
# Body:
#   i32.const 0x1000    ; addr
#   i32.const 42        ; value
#   call 0              ; poke(0x1000, 42)
#   i32.const 0x1000    ; addr
#   call 1              ; peek(0x1000) -> returns i32
#   local.set 0         ; store result in local 0
#   i32.const 0x1004    ; addr
#   local.get 0         ; get result
#   call 0              ; poke(0x1004, result)
#   end

func_body = bytes([
    # Locals: 1 entry, 1 local of type i32
    0x01,  # 1 local entry
    0x01,  # count: 1
    0x7F,  # type: i32

    # poke(0x1000, 42)
    0x41, 0x80, 0x20,  # i32.const 0x1000 (LEB128: 0x80 0x20 = 4096)
    0x41, 0x2A,        # i32.const 42
    0x10, 0x00,        # call 0 (poke)

    # val = peek(0x1000)
    0x41, 0x80, 0x20,  # i32.const 0x1000
    0x10, 0x01,        # call 1 (peek)
    0x21, 0x00,        # local.set 0

    # poke(0x1004, val)
    0x41, 0x84, 0x20,  # i32.const 0x1004 (LEB128: 0x84 0x20 = 4100)
    0x20, 0x00,        # local.get 0
    0x10, 0x00,        # call 0 (poke)

    0x0B,  # end
])

func_body_with_size = leb128_u(len(func_body)) + func_body

code_section_content = (
    leb128_u(1) +  # 1 function body
    func_body_with_size
)
code_section = section(10, code_section_content)

# Assemble the WASM
wasm = (magic + version + type_section + import_section + func_section +
        memory_section + export_section + start_section + code_section)

# Write to file
with open('host_test_manual.wasm', 'wb') as f:
    f.write(wasm)

print(f"Created host_test_manual.wasm ({len(wasm)} bytes)")
print(f"Imports: env.poke (func 0, type 0), env.peek (func 1, type 1)")
print(f"Function 2 (_start, type 2): calls poke and peek")
print(f"Exports: _start (func 2)")
print("")
print("Hex dump:")
for i in range(0, len(wasm), 16):
    hex_str = ' '.join(f'{b:02x}' for b in wasm[i:i+16])
    ascii_str = ''.join(chr(b) if 32 <= b < 127 else '.' for b in wasm[i:i+16])
    print(f"  {i:04x}: {hex_str:<48} {ascii_str}")

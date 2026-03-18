#!/usr/bin/env python3
"""
Geometry OS - Pure Python Glyph VM Runner
==========================================
Run Glyph programs WITHOUT Rust compilation. Just pixels.

Usage:
    python3 glyph_vm.py program.glyph
    python3 glyph_vm.py --asm "LDI r0, 42; HALT"
"""

import sys
import struct
from pathlib import Path

OPCODES = {
    "NOP": 0,
    "LDI": 1,
    "MOV": 2,
    "LOAD": 3,
    "STORE": 4,
    "ADD": 5,
    "SUB": 6,
    "MUL": 7,
    "DIV": 8,
    "JMP": 9,
    "JZ": 10,
    "CALL": 11,
    "RET": 12,
    "HALT": 13,
    "DATA": 14,
    "LOOP": 15,
    "JAL": 16,
    "AND": 128,
    "OR": 129,
    "XOR": 130,
    "SHL": 131,
    "SHR": 132,
    "SAR": 133,
    "SPAWN": 232,
    "GLYPH_WRITE": 232,
    "ATTENTION_FOCUS": 233,
    "GLYPH_MUTATE": 234,
    "SEMANTIC_MERGE": 235,
    "W_NOP": 140,
    "W_LD": 204,
    "W_ST": 205,
    "W_MOV": 206,
    "W_ADD": 142,
    "W_SUB": 143,
    "W_JMP": 208,
    "W_JZ": 209,
    "W_DRAW": 215,
    "W_HALT": 141,
    "M_NOP": 200,
    "M_ADD": 201,
    "M_SUB": 202,
    "M_MUL": 203,
    "M_DIV": 204,
    "M_LOAD": 205,
    "M_STORE": 206,
    "M_LOADIMM": 207,
    "M_JUMP": 208,
    "M_JUMPZ": 209,
    "M_JUMPNZ": 210,
    "M_CMP": 211,
    "M_AND": 212,
    "M_OR": 213,
    "M_XOR": 214,
    "M_NOT": 215,
    "M_SHL": 216,
    "M_SHR": 217,
    "M_CALL": 218,
    "M_RET": 219,
    "M_PUSH": 220,
    "M_POP": 221,
}

REVERSE_OPCODES = {v: k for k, v in OPCODES.items()}

BRANCH_CONDS = {"BEQ": 0, "BNE": 1, "BLT": 2, "BGE": 3, "BLTU": 4, "BGEU": 5, "JZ": 0, "JNZ": 1}


class GlyphVM:
    def __init__(self, memory_size=65536):
        self.memory = [0] * memory_size
        self.registers = [0] * 32
        self.pc = 0
        self.halted = False
        self.call_stack = []
        self.cycles = 0
        self.max_cycles = 10000
        self.trace = []

    def load_program(self, pixels):
        for i, pixel in enumerate(pixels):
            if i >= len(self.memory):
                break
            if isinstance(pixel, (list, tuple)):
                val = pixel[0] | (pixel[1] << 8) | (pixel[2] << 16) | (pixel[3] << 24)
                self.memory[i] = val
            else:
                self.memory[i] = pixel

    def fetch(self):
        if self.pc >= len(self.memory):
            self.halted = True
            return None
        instr = self.memory[self.pc]
        return instr

    def decode(self, instr):
        opcode = instr & 0xFF
        stratum = (instr >> 8) & 0xFF
        p1 = (instr >> 16) & 0xFF
        p2 = (instr >> 24) & 0xFF
        return opcode, stratum, p1, p2

    def sign_extend(self, val, bits=8):
        if val & (1 << (bits - 1)):
            return val - (1 << bits)
        return val

    def execute(self):
        if self.halted:
            return

        instr = self.fetch()
        if instr is None:
            self.halted = True
            return

        opcode, stratum, p1, p2 = self.decode(instr)

        self.trace.append(
            {
                "pc": self.pc,
                "opcode": opcode,
                "opname": REVERSE_OPCODES.get(opcode, f"UNK_{opcode}"),
                "stratum": stratum,
                "p1": p1,
                "p2": p2,
                "registers": self.registers[:8],
            }
        )

        self.pc += 1
        self.cycles += 1

        if opcode == 0:  # NOP
            pass
        elif opcode == 1:  # LDI rd, imm (2-word instr)
            rd = p1
            imm = self.memory[self.pc]
            self.registers[rd] = imm
            self.pc += 1
        elif opcode == 204:  # W_LD - Load from address (2-word: opcode + addr)
            rd = p1
            addr = self.memory[self.pc]
            self.registers[rd] = self.memory[addr & 0xFFFF]
            self.pc += 1
        elif opcode == 205:  # W_ST - Store to address (2-word: opcode + addr)
            rs = p1
            addr = self.memory[self.pc]
            self.memory[addr & 0xFFFF] = self.registers[rs]
            self.pc += 1
        elif opcode == 206:  # MOV
            rd = p1
            rs = stratum
            self.registers[rd] = self.registers[rs]
        elif opcode == 5:  # ADD
            rd = p1
            rs = stratum
            self.registers[rd] = (self.registers[rd] + self.registers[rs]) & 0xFFFFFFFF
        elif opcode == 6:  # SUB
            rd = p1
            rs = stratum
            self.registers[rd] = (self.registers[rd] - self.registers[rs]) & 0xFFFFFFFF
        elif opcode == 7:  # MUL
            rd = p1
            rs = stratum
            self.registers[rd] = (self.registers[rd] * self.registers[rs]) & 0xFFFFFFFF
        elif opcode == 9 or opcode == 208:  # JMP / M_JUMP
            target = p1 | (stratum << 8)
            self.pc = target
        elif opcode == 10 or opcode == 209:  # JZ / M_JUMPZ
            # Encoding: [opcode, rs, target_low, target_high]
            # JZ rX, target: jump to target if rX == 0
            rs = stratum  # register to check is in stratum field
            if self.registers[rs] == 0:
                target = p1 | (p2 << 8)
                self.pc = target
        elif opcode == 11:  # CALL
            self.call_stack.append(self.pc + 2)
            offset = self.sign_extend(stratum | (p1 << 8), 16)
            self.pc = (self.pc + offset) & 0xFFFF
        elif opcode == 12 or opcode == 219:  # RET / M_RET
            if self.call_stack:
                self.pc = self.call_stack.pop()
        elif opcode == 13 or opcode == 141:  # HALT / W_HALT
            self.halted = True
        elif opcode == 128:  # AND
            rd = p1
            rs = stratum
            self.registers[rd] = self.registers[rd] & self.registers[rs]
        elif opcode == 129:  # OR
            rd = p1
            rs = stratum
            self.registers[rd] = self.registers[rd] | self.registers[rs]
        elif opcode == 130:  # XOR
            rd = p1
            rs = stratum
            self.registers[rd] = self.registers[rd] ^ self.registers[rs]
        elif opcode == 131:  # SHL
            rd = p1
            self.registers[rd] = (self.registers[rd] << stratum) & 0xFFFFFFFF
        elif opcode == 132:  # SHR
            rd = p1
            self.registers[rd] = self.registers[rd] >> stratum
        elif opcode == 201:  # M_ADD
            addr = p1
            self.memory[addr] = (self.memory[addr] + self.memory[addr + 1]) & 0xFFFFFFFF
        elif opcode == 207:  # M_LOADIMM
            addr = p1
            imm = stratum
            self.memory[addr] = imm

        if self.cycles >= self.max_cycles:
            self.halted = True
            print(f"Warning: Hit max cycles ({self.max_cycles})")

    def run(self, verbose=True):
        step = 0
        while not self.halted:
            self.execute()
            step += 1
            if verbose and step % 1000 == 0:
                print(f"Cycle {step}, PC={self.pc}, r0={self.registers[0]}")

        if verbose:
            print(f"\n=== Execution Complete ===")
            print(f"Cycles: {self.cycles}")
            print(f"PC: {self.pc}")
            print(f"Registers: {self.registers[:8]}")

    def dump_trace(self, count=20):
        print(f"\n=== Last {count} Instructions ===")
        for t in self.trace[-count:]:
            print(f"PC={t['pc']:4d}: {t['opname']:8s} op={t['opcode']:3d} r={t['registers'][:4]}")


def parse_glyph(source):
    """Parse Glyph assembly to pixel program."""
    symbols = {}
    instructions = []
    current_addr = 0

    # Pass 1: Collect labels
    for line in source.split("\n"):
        line = line.strip().split("//")[0].split(";")[0]
        if not line:
            continue
        if line.startswith(":"):
            symbols[line[1:].strip()] = current_addr
            continue
        if line.upper().startswith("LDI") or line.upper().startswith("JAL"):
            current_addr += 2
        else:
            current_addr += 1

    # Pass 2: Generate instructions
    final_pixels = []
    current_addr = 0

    for line in source.split("\n"):
        line = line.strip().split("//")[0].split(";")[0]
        if not line or line.startswith(".") or line.startswith(":"):
            continue

        parts = line.replace(",", " ").split()
        op_name = parts[0].upper()

        if op_name not in OPCODES:
            continue

        opcode = OPCODES[op_name]

        if op_name == "LDI":
            rd = int(parts[1].lower().replace("r", ""))
            try:
                imm = int(parts[2], 0)
            except:
                imm = symbols.get(parts[2], 0)

            final_pixels.append([opcode, 2, rd, 0])
            final_pixels.append(
                [imm & 0xFF, (imm >> 8) & 0xFF, (imm >> 16) & 0xFF, (imm >> 24) & 0xFF]
            )
            current_addr += 2

        elif op_name == "ADD":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([opcode, rs, rd, 0])
            current_addr += 1

        elif op_name == "SUB":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([opcode, rs, rd, 0])
            current_addr += 1

        elif op_name == "MOV":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([206, rs, rd, 0])
            current_addr += 1

        elif op_name == "STORE":
            rs = int(parts[1].lower().replace("r", ""))
            addr = int(parts[2], 0) if parts[2].startswith("0x") else int(parts[2])
            final_pixels.append([205, 2, rs, 0])
            final_pixels.append([addr & 0xFF, (addr >> 8) & 0xFF, 0, 0])
            current_addr += 2

        elif op_name == "LOAD":
            rd = int(parts[1].lower().replace("r", ""))
            addr = int(parts[2], 0) if parts[2].startswith("0x") else int(parts[2])
            final_pixels.append([204, 2, rd, 0])
            final_pixels.append([addr & 0xFF, (addr >> 8) & 0xFF, 0, 0])
            current_addr += 2

        elif op_name == "JMP":
            target = symbols.get(parts[1], 0)
            if target == 0:
                try:
                    target = int(parts[1], 0)
                except:
                    target = 0
            final_pixels.append([9, 0, target & 0xFF, (target >> 8) & 0xFF])
            current_addr += 1

        elif op_name == "JZ":
            rs = int(parts[1].lower().replace("r", ""))
            target = symbols.get(parts[2], 0)
            if target == 0:
                try:
                    target = int(parts[2], 0)
                except:
                    target = 0
            final_pixels.append([10, rs, target & 0xFF, (target >> 8) & 0xFF])
            current_addr += 1

        elif op_name == "CALL":
            target = symbols.get(parts[1], 0)
            if target == 0:
                try:
                    target = int(parts[1], 0)
                except:
                    target = 0
            offset = target - (current_addr + 1)
            final_pixels.append([11, offset & 0xFF, (offset >> 8) & 0xFF, 0])
            current_addr += 1

        elif op_name == "RET":
            final_pixels.append([12, 0, 0, 0])
            current_addr += 1

        elif op_name == "HALT":
            final_pixels.append([13, 0, 0, 0])
            current_addr += 1

        elif op_name == "AND":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([128, rs, rd, 0])
            current_addr += 1

        elif op_name == "OR":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([129, rs, rd, 0])
            current_addr += 1

        elif op_name == "XOR":
            rd = int(parts[1].lower().replace("r", ""))
            rs = int(parts[2].lower().replace("r", ""))
            final_pixels.append([130, rs, rd, 0])
            current_addr += 1

        elif op_name == "SHL":
            rd = int(parts[1].lower().replace("r", ""))
            imm = int(parts[2], 0)
            final_pixels.append([131, imm, rd, 0])
            current_addr += 1

        elif op_name == "SHR":
            rd = int(parts[1].lower().replace("r", ""))
            imm = int(parts[2], 0)
            final_pixels.append([132, imm, rd, 0])
            current_addr += 1

        else:
            # Generic single-word instruction
            val1 = int(parts[1].lower().replace("r", "")) if len(parts) > 1 else 0
            final_pixels.append([opcode, val1, 0, 0])
            current_addr += 1

    return final_pixels


def run_asm(asm_source, verbose=True):
    """Parse and run Glyph assembly."""
    pixels = parse_glyph(asm_source)
    if verbose:
        print(f"Compiled {len(pixels)} instruction pixels")

    vm = GlyphVM()
    vm.load_program(pixels)
    vm.run(verbose=verbose)

    return vm


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        print("\n=== Demo Programs ===\n")

        # Demo 1: Simple addition
        asm1 = """
LDI r1, 10
LDI r2, 32
ADD r1, r2
HALT
"""
        print("Demo 1: 10 + 32")
        vm1 = run_asm(asm1)
        print(f"Result: r1 = {vm1.registers[1]} (expected 42)\n")

        # Demo 2: Loop - add 1 ten times
        asm2 = """
LDI r0, 0
LDI r1, 1
LDI r2, 10
:loop
ADD r0, r1
SUB r2, r1
JZ r2, end
JMP loop
:end
HALT
"""
        print("Demo 2: Loop (0+1+1+1... until 10)")
        vm2 = run_asm(asm2)
        print(f"Result: r0 = {vm2.registers[0]} (expected 10)\n")

        # Demo 3: Memory store/load
        asm3 = """
LDI r0, 12345
STORE r0, 256
LOAD r1, 256
HALT
"""
        print("Demo 3: Store to memory, load back")
        vm3 = run_asm(asm3)
        print(f"Result: r1 = {vm3.registers[1]} (expected 12345)\n")

        return

    arg = sys.argv[1]

    if arg == "--asm" or arg == "-a":
        asm = sys.argv[2] if len(sys.argv) > 2 else "LDI r0, 42; HALT"
        asm = asm.replace(";", "\n")
        run_asm(asm)

    elif Path(arg).exists():
        source = Path(arg).read_text()
        vm = run_asm(source)
        vm.dump_trace()

    else:
        print(f"File not found: {arg}")
        print(__doc__)


if __name__ == "__main__":
    main()

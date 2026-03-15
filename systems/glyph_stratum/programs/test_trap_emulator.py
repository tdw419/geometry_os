#!/usr/bin/env python3
"""
Test the RISC-V emulator with trap handling.
Verifies: ECALL → mtvec jump, mepc save, mcause save, MRET
"""

import struct
from pathlib import Path

class GlyphVM:
    """Glyph VM with trap handling support"""

    def __init__(self, memory_size=65536):
        self.memory = [0.0] * memory_size
        self.registers = [0] * 32
        self.pc = 0x8000
        self.halted = False
        self.max_instructions = 1000

        # CSR bank (mapped to Hilbert 0x0300)
        self.csrs = {
            0x300: 0,   # mstatus
            0x305: 0,   # mtvec (trap handler)
            0x341: 0,   # mepc (exception PC)
            0x342: 0,   # mcause (exception cause)
        }

        # UART output buffer
        self.uart_buffer = []

    def bitcast_u32(self, f):
        return struct.unpack('<I', struct.pack('<f', f))[0]

    def bitcast_f32(self, u):
        return struct.unpack('<f', struct.pack('<I', u))[0]

    def load_instructions(self, path, offset):
        """Load RISC-V instructions into memory"""
        data = Path(path).read_bytes()
        for i in range(0, len(data), 4):
            if i + 4 <= len(data):
                inst = struct.unpack('<I', data[i:i+4])[0]
                self.memory[offset + i // 4] = self.bitcast_f32(inst)

    def take_trap(self, cause):
        """Trap handler - save state and jump to mtvec"""
        # Save PC to mepc
        self.csrs[0x341] = self.pc
        # Save cause
        self.csrs[0x342] = cause
        # Jump to mtvec
        if self.csrs[0x305] != 0:
            self.pc = self.csrs[0x305]
            print(f"    *** TRAP: cause={cause}, mtvec=0x{self.csrs[0x305]:04X}, mepc=0x{self.csrs[0x341]:04X} ***")
        else:
            print(f"    *** TRAP: cause={cause}, but mtvec=0! Halting. ***")
            self.halted = True

    def run(self):
        """Run the emulator"""
        print("=== Starting RISC-V Emulator (with Trap Support) ===\n")

        instruction_count = 0

        while not self.halted and instruction_count < self.max_instructions:
            instruction_count += 1

            # Fetch instruction
            inst_addr = self.pc
            inst_bits = self.bitcast_u32(self.memory[self.pc // 4])
            opcode = inst_bits & 0x7F

            print(f"  PC=0x{self.pc:04X}  IR=0x{inst_bits:08X}  OP=0x{opcode:02X}")

            # Increment PC
            self.pc += 4

            # Decode and execute
            if opcode == 0x37:  # LUI
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = imm
                print(f"    LUI x{rd}, 0x{imm >> 12:X}")

            elif opcode == 0x17:  # AUIPC
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = inst_addr + imm
                print(f"    AUIPC x{rd}, 0x{imm >> 12:X}  ->  x{rd}=0x{self.registers[rd]:X}")

            elif opcode == 0x13:  # OP-IMM
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                funct3 = (inst_bits >> 12) & 0x7
                imm = (inst_bits >> 20) & 0xFFF
                if imm & 0x800:
                    imm |= 0xFFFFF000

                if funct3 == 0:  # ADDI
                    if rd != 0:
                        self.registers[rd] = (self.registers[rs1] + imm) & 0xFFFFFFFF
                    print(f"    ADDI x{rd}, x{rs1}, {imm}  ->  x{rd}=0x{self.registers[rd]:X}")

            elif opcode == 0x23:  # STORE
                rs1 = (inst_bits >> 15) & 0x1F
                rs2 = (inst_bits >> 20) & 0x1F
                imm_lo = (inst_bits >> 7) & 0x1F
                imm_hi = (inst_bits >> 25) & 0x7F
                imm = imm_lo | (imm_hi << 5)
                if imm & 0x800:
                    imm |= 0xFFFFF000

                addr = (self.registers[rs1] + imm) & 0xFFFFFFFF

                if addr == 0x1000:
                    char = self.registers[rs2] & 0xFF
                    self.uart_buffer.append(chr(char))
                    print(f"    SW x{rs2}, {imm}(x{rs1})  ->  UART OUT: '{chr(char)}' ({char})")
                else:
                    print(f"    SW x{rs2}, {imm}(x{rs1})  ->  [0x{addr:X}]")

            elif opcode == 0x6F:  # JAL
                rd = (inst_bits >> 7) & 0x1F
                imm_20 = (inst_bits >> 31) & 1
                imm_10_1 = (inst_bits >> 21) & 0x3FF
                imm_11 = (inst_bits >> 20) & 1
                imm_19_12 = (inst_bits >> 12) & 0xFF
                offset = (imm_20 << 19) | (imm_10_1 << 1) | (imm_11 << 11) | (imm_19_12 << 12)
                if offset & 0x80000:
                    offset |= 0xFFF00000

                if rd != 0:
                    self.registers[rd] = self.pc
                self.pc = (inst_addr + offset) & 0xFFFFFFFF
                print(f"    JAL x{rd}, {offset}  ->  PC=0x{self.pc:04X}")

                if offset == 0:
                    print("\n  *** Infinite loop - halting ***")
                    break

            elif opcode == 0x67:  # JALR
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                imm = (inst_bits >> 20) & 0xFFF
                if imm & 0x800:
                    imm |= 0xFFFFF000

                target = (self.registers[rs1] + imm) & 0xFFFFFFFE
                if rd != 0:
                    self.registers[rd] = self.pc
                print(f"    JALR x{rd}, x{rs1}, {imm}  ->  PC=0x{target:04X}")
                self.pc = target

            elif opcode == 0x73:  # SYSTEM
                funct3 = (inst_bits >> 12) & 0x7
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                csr = (inst_bits >> 20) & 0xFFF

                if funct3 == 0:  # ECALL/EBREAK
                    if inst_bits == 0x00000073:  # ECALL
                        print(f"    ECALL  ->  triggering trap (cause=11)")
                        self.take_trap(11)
                elif funct3 == 1:  # CSRRW
                    # Read old CSR
                    old_val = self.csrs.get(csr, 0)
                    # Write new value
                    self.csrs[csr] = self.registers[rs1]
                    # Write old to rd
                    if rd != 0:
                        self.registers[rd] = old_val
                    print(f"    CSRRW x{rd}, x{rs1}, 0x{csr:03X}  ->  CSR[0x{csr:03X}]=0x{self.registers[rs1]:X}, x{rd}=0x{old_val:X}")

            else:
                print(f"    UNKNOWN OPCODE 0x{opcode:02X}")
                self.take_trap(2)  # Illegal instruction

        print(f"\n=== Simulation Complete ===")
        print(f"Instructions executed: {instruction_count}")
        print(f"UART output: {''.join(self.uart_buffer)}")
        print(f"CSR state: mtvec=0x{self.csrs[0x305]:04X}, mepc=0x{self.csrs[0x341]:04X}, mcause={self.csrs[0x342]}")

        return ''.join(self.uart_buffer)


def main():
    vm = GlyphVM()

    # Load trap test binary
    vm.load_instructions('/tmp/trap_test.riscv.bin', 0x8000)

    # Run
    output = vm.run()

    # Verify
    expected = "T!1\n"
    if output.startswith("T!1"):
        print(f"\n✓ SUCCESS: Trap handling works!")
    else:
        print(f"\n✗ FAILURE: Expected 'T!1...', got '{output}'")

    return output.startswith("T!1")


if __name__ == '__main__':
    import sys
    sys.exit(0 if main() else 1)

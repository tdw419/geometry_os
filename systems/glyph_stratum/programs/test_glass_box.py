#!/usr/bin/env python3
"""
Glass Box Visualization - Using verified emulator with register display.
"""

import struct
from pathlib import Path

class VerifiedGlassBoxVM:
    """RISC-V emulator with glass box visualization - verified instruction set"""

    def __init__(self, memory_size=65536):
        self.memory = [0.0] * memory_size
        self.registers = [0] * 32
        self.pc = 0x8000
        self.halted = False
        self.max_instructions = 20

        self.csrs = {0x300: 0, 0x305: 0, 0x341: 0, 0x342: 0}
        self.uart_buffer = []
        self.cycle = 0

    def bitcast_u32(self, f):
        return struct.unpack('<I', struct.pack('<f', f))[0]

    def bitcast_f32(self, u):
        return struct.unpack('<f', struct.pack('<I', u))[0]

    def load_instructions(self, path, offset):
        data = Path(path).read_bytes()
        for i in range(0, len(data), 4):
            if i + 4 <= len(data):
                inst = struct.unpack('<I', data[i:i+4])[0]
                self.memory[offset + i // 4] = self.bitcast_f32(inst)

    def render_registers(self, inst_str=""):
        """Render current CPU state"""
        print(f"\n┌─ Cycle {self.cycle:3d} ─ PC: 0x{self.pc:04X} ─{'─'*40}┐")
        if inst_str:
            print(f"│ {inst_str:<78} │")
        print("├" + "─"*78 + "┤")

        for row in range(4):
            line = "│ "
            for col in range(8):
                reg_idx = row * 8 + col
                val = self.registers[reg_idx]
                line += f"x{reg_idx:02d}={val:08X} "
            print(line + "│")

        uart_str = ''.join(self.uart_buffer)
        if uart_str:
            printable = ''.join(c if c.isprintable() or c == '\n' else '.' for c in uart_str)
            print(f"│ UART: {printable:<70} │")

        print("└" + "─"*78 + "┘")

    def take_trap(self, cause):
        self.csrs[0x341] = self.pc
        self.csrs[0x342] = cause
        if self.csrs[0x305] != 0:
            self.pc = self.csrs[0x305]

    def run(self):
        print("\n" + "═"*80)
        print("  GLASS BOX CPU VISUALIZER - Watching RISC-V Execute in Real-Time")
        print("═"*80)

        while not self.halted and self.cycle < self.max_instructions:
            inst_addr = self.pc
            inst_bits = self.bitcast_u32(self.memory[self.pc // 4])
            opcode = inst_bits & 0x7F

            self.cycle += 1
            inst_str = f"IR=0x{inst_bits:08X} OP=0x{opcode:02X}"

            self.pc += 4

            if opcode == 0x37:  # LUI
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = imm
                inst_str += f" LUI x{rd}, 0x{imm>>12:X} → x{rd}=0x{self.registers[rd]:X}"

            elif opcode == 0x17:  # AUIPC
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = (inst_addr + imm) & 0xFFFFFFFF
                inst_str += f" AUIPC x{rd}, 0x{imm>>12:X} → x{rd}=0x{self.registers[rd]:X}"

            elif opcode == 0x13:  # OP-IMM
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                funct3 = (inst_bits >> 12) & 0x7
                imm_s = (inst_bits >> 20)
                if imm_s & 0x800:
                    imm_s |= 0xFFFFF000
                imm = imm_s & 0xFFFFFFFF

                if funct3 == 0:  # ADDI
                    if rd != 0:
                        self.registers[rd] = (self.registers[rs1] + imm_s) & 0xFFFFFFFF
                    char = chr(self.registers[rd]) if 32 <= self.registers[rd] < 127 else f"0x{self.registers[rd]:X}"
                    inst_str += f" ADDI x{rd}, x{rs1}, {imm_s} → x{rd}={char}"

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
                    inst_str += f" SW x{rs2}, {imm}(x{rs1}) → UART: '{chr(char)}'"
                else:
                    inst_str += f" SW x{rs2}, {imm}(x{rs1}) → [0x{addr:X}]"

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
                inst_str += f" JAL x{rd}, {offset} → PC=0x{self.pc:04X}"

                if offset == 0:
                    inst_str += " [INFINITE LOOP]"
                    self.render_registers(inst_str)
                    break

            elif opcode == 0x67:  # JALR
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                imm = (inst_bits >> 20)
                if imm & 0x800:
                    imm |= 0xFFFFF000

                target = (self.registers[rs1] + imm) & 0xFFFFFFFE
                if rd != 0:
                    self.registers[rd] = self.pc
                inst_str += f" JALR x{rd}, x{rs1}, {imm} → PC=0x{target:04X}"
                self.pc = target

            elif opcode == 0x73:  # SYSTEM
                funct3 = (inst_bits >> 12) & 0x7
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                csr = (inst_bits >> 20) & 0xFFF

                if funct3 == 0:  # ECALL
                    inst_str += f" ECALL → TRAP(11)"
                    self.render_registers(inst_str)
                    self.take_trap(11)
                elif funct3 == 1:  # CSRRW
                    old_val = self.csrs.get(csr, 0)
                    self.csrs[csr] = self.registers[rs1]
                    if rd != 0:
                        self.registers[rd] = old_val
                    inst_str += f" CSRRW x{rd}, x{rs1}, 0x{csr:03X}"

            else:
                inst_str += f" UNKNOWN OP"

            self.render_registers(inst_str)

        print(f"\n{'═'*80}")
        print(f"  FINAL OUTPUT: {''.join(self.uart_buffer)}")
        print(f"{'═'*80}")


def main():
    vm = VerifiedGlassBoxVM()
    vm.load_instructions('/tmp/hello_geos.riscv.bin', 0x8000)
    vm.run()


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""
Glass Box Visualization Test.
Shows RISC-V register state in real-time as the emulator runs.
"""

import struct
from pathlib import Path

class GlassBoxVM:
    """RISC-V emulator with glass box visualization"""

    def __init__(self, memory_size=65536):
        self.memory = [0.0] * memory_size
        self.registers = [0] * 32
        self.pc = 0x8000
        self.halted = False
        self.max_instructions = 50

        self.csrs = {
            0x300: 0, 0x305: 0, 0x341: 0, 0x342: 0,
        }

        self.uart_buffer = []
        self.frame_count = 0

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

    def render_registers(self):
        """Render register state as ASCII art"""
        print("\n┌" + "─" * 88 + "┐")
        print(f"│  PC: 0x{self.pc:04X}  │  Frame: {self.frame_count:4d}  │  UART: {''.join(self.uart_buffer[-20:])}'")
        print("├" + "─" * 88 + "┤")

        # Render 4 rows of 8 registers each
        for row in range(4):
            line = "│ "
            for col in range(8):
                reg_idx = row * 8 + col
                val = self.registers[reg_idx]
                if reg_idx == 0:
                    line += "x00=00000000 "
                else:
                    line += f"x{reg_idx:02d}={val:08X} "
            line += " │"
            print(line)

        print("└" + "─" * 88 + "┘")

    def take_trap(self, cause):
        self.csrs[0x341] = self.pc
        self.csrs[0x342] = cause
        if self.csrs[0x305] != 0:
            self.pc = self.csrs[0x305]

    def run(self):
        print("╔" + "═" * 60 + "╗")
        print("║" + " GLASS BOX CPU VISUALIZER ".center(60) + "║")
        print("╚" + "═" * 60 + "╝")

        instruction_count = 0

        while not self.halted and instruction_count < self.max_instructions:
            # Render every 5 instructions
            if instruction_count % 5 == 0:
                self.render_registers()

            instruction_count += 1
            self.frame_count += 1

            inst_addr = self.pc
            inst_bits = self.bitcast_u32(self.memory[self.pc // 4])
            opcode = inst_bits & 0x7F

            self.pc += 4

            # Decode and execute (simplified)
            if opcode == 0x37:  # LUI
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = imm

            elif opcode == 0x17:  # AUIPC
                rd = (inst_bits >> 7) & 0x1F
                imm = inst_bits & 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = inst_addr + imm

            elif opcode == 0x13:  # OP-IMM
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                imm = (inst_bits >> 20)
                if imm & 0x800:
                    imm |= 0xFFFFF000
                if rd != 0:
                    self.registers[rd] = (self.registers[rs1] + imm) & 0xFFFFFFFF

            elif opcode == 0x23:  # STORE
                rs1 = (inst_bits >> 15) & 0x1F
                rs2 = (inst_bits >> 20) & 0x1F
                imm = ((inst_bits >> 7) & 0x1F) | (((inst_bits >> 25) & 0x7F) << 5)
                if imm & 0x800:
                    imm |= 0xFFFFF000
                addr = (self.registers[rs1] + imm) & 0xFFFFFFFF
                if addr == 0x1000:
                    char = self.registers[rs2] & 0xFF
                    self.uart_buffer.append(chr(char))

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
                if offset == 0:
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
                self.pc = target

            elif opcode == 0x73:  # SYSTEM
                funct3 = (inst_bits >> 12) & 0x7
                rd = (inst_bits >> 7) & 0x1F
                rs1 = (inst_bits >> 15) & 0x1F
                csr = (inst_bits >> 20) & 0xFFF

                if funct3 == 0:  # ECALL
                    self.take_trap(11)
                elif funct3 == 1:  # CSRRW
                    old_val = self.csrs.get(csr, 0)
                    self.csrs[csr] = self.registers[rs1]
                    if rd != 0:
                        self.registers[rd] = old_val

        # Final state
        self.render_registers()
        print(f"\n=== Complete ===")
        print(f"UART output: {''.join(self.uart_buffer)}")


def main():
    vm = GlassBoxVM()
    vm.load_instructions('/tmp/hello_geos.riscv.bin', 0x8000)
    vm.run()


if __name__ == '__main__':
    main()

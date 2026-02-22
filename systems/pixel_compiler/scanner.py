#!/usr/bin/env python3
"""
Program Scanner: Binary/ELF → ASCII Morphology Graph

This tool represents the "Extraction" phase of the Ouroboros Loop.
It takes an existing RISC-V program and generates a symbolic ASCII 
Scene Graph that describes the code's structure, flow, and logic.

This ASCII graph is the primary input for AI Agents to "see" 
software before they "re-materialize" it into pixels.

Usage:
    python3 scanner.py scan <program.elf> <output.ascii>
"""

import sys
import os
import subprocess
import re
from pathlib import Path

class ProgramScanner:
    def __init__(self):
        self.objdump = "riscv64-linux-gnu-objdump"

    def scan(self, elf_path: Path) -> str:
        """Scan ELF file and produce ASCII Morphology"""
        try:
            # 1. Get disassembly
            result = subprocess.run(
                [self.objdump, "-d", str(elf_path)],
                check=True, capture_output=True, text=True
            )
            disasm = result.stdout
            
            # 2. Get section info
            result = subprocess.run(
                [self.objdump, "-h", str(elf_path)],
                check=True, capture_output=True, text=True
            )
            headers = result.stdout
            
        except subprocess.CalledProcessError as e:
            return f"Error scanning file: {e.stderr}"

        # Parse and Build ASCII Graph
        morphology = []
        morphology.append("╔══════════════════════════════════════════════════════════╗")
        morphology.append(f"║ SOFTWARE MORPHOLOGY: {elf_path.name:<35} ║")
        morphology.append("╠══════════════════════════════════════════════════════════╣")
        
        # Parse Sections
        morphology.append("║ [SECTIONS]                                               ║")
        section_re = re.compile(r"^\s*\d+\s+(\.\S+)\s+([0-9a-fA-F]+)\s+")
        for line in headers.splitlines():
            m = section_re.match(line)
            if m:
                name, size = m.groups()
                morphology.append(f"║  ├─ {name:<12} | Size: {int(size, 16):<10} bytes           ║")
        
        morphology.append("╠══════════════════════════════════════════════════════════╣")
        morphology.append("║ [CODE STRUCTURE / FLOW]                                  ║")
        
        # Parse Functions and Control Flow
        func_re = re.compile(r"^([0-9a-fA-F]+) <([^>]+)>:")
        instr_re = re.compile(r"^\s+([0-9a-fA-F]+):\s+([0-9a-fA-F]+)\s+(\S+)\s*(.*)")
        
        for line in disasm.splitlines():
            # Check for function header
            m_func = func_re.match(line)
            if m_func:
                addr, name = m_func.groups()
                morphology.append(f"║  ▶ FUNCTION: {name:<43} ║")
                continue
                
            # Check for instruction (simplified logic extraction)
            m_instr = instr_re.match(line)
            if m_instr:
                addr, hex_code, op, args = m_instr.groups()
                
                # Highlight Control Flow
                if op in ['j', 'jal', 'jalr', 'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
                    morphology.append(f"║    ├─ [FLOW] {op:<6} | {args:<30} ║")
                # Highlight Memory access
                elif op in ['lw', 'sw', 'lb', 'sb', 'lh', 'sh']:
                    morphology.append(f"║    ├─ [MEM]  {op:<6} | {args:<30} ║")

        morphology.append("╚══════════════════════════════════════════════════════════╝")
        return "\n".join(morphology)

def main():
    if len(sys.argv) < 4:
        print("Usage: python3 scanner.py scan <input.elf> <output.ascii>")
        sys.exit(1)
        
    cmd = sys.argv[1]
    if cmd == "scan":
        input_path = Path(sys.argv[2])
        output_path = Path(sys.argv[3])
        
        scanner = ProgramScanner()
        ascii_graph = scanner.scan(input_path)
        
        with open(output_path, 'w') as f:
            f.write(ascii_graph)
        
        print(f"✅ Generated ASCII Morphology: {output_path}")

if __name__ == "__main__":
    main()

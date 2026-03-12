import json
import os

def create_bootstrap_program():
    """
    Creates a 'Multiply' program using Glyph Microcode opcodes.
    The program multiplies 7 * 6 and halts.
    """
    
    # Opcode mapping (200-215 range)
    MICRO_OPCODES = {
        "ADD_M": 200, "SUB_M": 201, "MUL_M": 202, "DIV_M": 203,
        "LD": 204, "ST": 205, "MOV": 206, "CLR": 207,
        "JMP": 208, "JZ": 209, "CALL_M": 210, "RET_M": 211,
        "HALT_M": 212, "SYNC": 213, "INT": 214, "DRAW": 215
    }

    # Program: Multiplies two numbers (stored in memory)
    # 0: MOV target=0, p1=7.0 (Operand A)
    # 1: MOV target=1, p1=6.0 (Operand B)
    # 2: MUL_M target=2, p1=memory[0], p2=memory[1] (Requires LD first in real HW, but MUL_M here takes params)
    # Wait, the WGSL MUL_M takes glyph.p1 and glyph.p2 literal params. 
    # Let's adjust for a more 'microcode' feel:
    
    program = [
        # Set operands in memory (via registers/p1 literals for this bootstrap)
        {"opcode": MICRO_OPCODES["MOV"], "target": 0, "p1": 7.0, "p2": 0.0, "rationale": "Load 7 into memory[0]"},
        {"opcode": MICRO_OPCODES["MOV"], "target": 1, "p1": 6.0, "p2": 0.0, "rationale": "Load 6 into memory[1]"},
        
        # Load values into internal params (In this simple VM, we'll just use literals for the demo)
        {"opcode": MICRO_OPCODES["MUL_M"], "target": 2, "p1": 7.0, "p2": 6.0, "rationale": "Multiply 7 * 6"},
        
        # Halt
        {"opcode": MICRO_OPCODES["HALT_M"], "target": 0, "p1": 0.0, "p2": 0.0, "rationale": "Halt execution"}
    ]

    bootstrap_data = {
        "name": "multiply_microcode_bootstrap",
        "glyphs": {str(i): {
            "opcode": p["opcode"],
            "stratum": 2, # LOGIC stratum
            "p1": p["p1"],
            "p2": p["p2"],
            "target": p["target"],
            "rationale": p["rationale"],
            "dependencies": [str(i-1)] if i > 0 else []
        } for i, p in enumerate(program)}
    }

    output_path = os.path.join(os.path.dirname(__file__), "microcode_multiply.json")
    with open(output_path, "w") as f:
        json.dump(bootstrap_data, f, indent=2)
    
    print(f"Bootstrap program created: {output_path}")

if __name__ == "__main__":
    create_bootstrap_program()

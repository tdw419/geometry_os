import json
import os

def create_renderer_demo():
    """
    Creates the 'Ouroboros Renderer' demo program.
    This program uses the DRAW micro-opcode to render other glyphs.
    """
    
    # Opcode mapping (200-215 range)
    MICRO_OPCODES = {
        "ADD_M": 200, "SUB_M": 201, "MUL_M": 202, "DIV_M": 203,
        "LD": 204, "ST": 205, "MOV": 206, "CLR": 207,
        "JMP": 208, "JZ": 209, "CALL_M": 210, "RET_M": 211,
        "HALT_M": 212, "SYNC": 213, "INT": 214, "DRAW": 215
    }

    # Core Opcodes (for rendering)
    CORE_OPCODES = {
        "DATA": 0, "LOAD": 1, "STORE": 2, "ALLOC": 3, "FREE": 4
    }

    # Program: Renders a row of glyphs
    # DRAW(p1=src_id, p2=dst_x, target=dst_y)
    
    program = [
        # Render "DATA" at (100, 100)
        {"opcode": MICRO_OPCODES["DRAW"], "p1": CORE_OPCODES["DATA"], "p2": 100.0, "target": 100, "rationale": "Render DATA"},
        
        # Render "LOAD" at (164, 100)
        {"opcode": MICRO_OPCODES["DRAW"], "p1": CORE_OPCODES["LOAD"], "p2": 164.0, "target": 100, "rationale": "Render LOAD"},
        
        # Render "STORE" at (228, 100)
        {"opcode": MICRO_OPCODES["DRAW"], "p1": CORE_OPCODES["STORE"], "p2": 228.0, "target": 100, "rationale": "Render STORE"},
        
        # Render "ADD_M" (itself) at (100, 164)
        {"opcode": MICRO_OPCODES["DRAW"], "p1": MICRO_OPCODES["ADD_M"], "p2": 100.0, "target": 164, "rationale": "Render ADD_M"},

        # Halt
        {"opcode": MICRO_OPCODES["HALT_M"], "p1": 0.0, "p2": 0.0, "target": 0, "rationale": "Halt execution"}
    ]

    bootstrap_data = {
        "name": "ouroboros_renderer_demo",
        "glyphs": {str(i): {
            "opcode": p["opcode"],
            "stratum": 2, 
            "p1": p["p1"],
            "p2": p["p2"],
            "target": p["target"],
            "rationale": p["rationale"],
            "dependencies": [str(i-1)] if i > 0 else []
        } for i, p in enumerate(program)}
    }

    output_path = os.path.join(os.path.dirname(__file__), "ouroboros_renderer.json")
    with open(output_path, "w") as f:
        json.dump(bootstrap_data, f, indent=2)
    
    print(f"Ouroboros Renderer program created: {output_path}")

if __name__ == "__main__":
    create_renderer_demo()

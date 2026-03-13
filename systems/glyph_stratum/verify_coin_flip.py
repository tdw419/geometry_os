import json
import struct
import os

def generate_coin_flip_program():
    """
    Generates a binary GlyphStratum program that simulates a coin flip 
    using the new probabilistic opcodes.
    
    Architecture:
    - Address 0: BRANCH_PROB (Opcode 220) with 0.5 threshold. 
                 If random < 0.5, jump to 'Heads' (Address 2).
                 Else, continue to 'Tails' (Address 1).
    - Address 1: MOV (Opcode 206) - Set Memory[10] to 2.0 (Tails)
                 JMP (Opcode 208) to HALT (Address 4)
    - Address 2: MOV (Opcode 206) - Set Memory[10] to 1.0 (Heads)
                 JMP (Opcode 208) to HALT (Address 4)
    - Address 4: HALT (Opcode 212)
    """
    
    # Glyph structure: { opcode: u32, stratum: u32, p1: f32, p2: f32, target: u32 }
    # 5 * 4 bytes = 20 bytes per glyph
    
    program = []
    
    # 0: BRANCH_PROB p1=0.5 (threshold), p2=2.0 (jump target if < 0.5)
    program.append({
        "opcode": 220, "stratum": 1, "p1": 0.5, "p2": 2.0, "target": 0
    })
    
    # 1: TAILS PATH - MOV memory[10] = 2.0
    program.append({
        "opcode": 206, "stratum": 1, "p1": 2.0, "p2": 0.0, "target": 10
    })
    
    # 2: HEADS PATH - MOV memory[10] = 1.0
    program.append({
        "opcode": 206, "stratum": 1, "p1": 1.0, "p2": 0.0, "target": 10
    })
    
    # 3: JUMP TO HALT (Address 4)
    program.append({
        "opcode": 208, "stratum": 1, "p1": 4.0, "p2": 0.0, "target": 0
    })
    
    # 4: HALT
    program.append({
        "opcode": 212, "stratum": 1, "p1": 0.0, "p2": 0.0, "target": 0
    })
    
    # Binary packing
    binary_data = bytearray()
    for g in program:
        binary_data.extend(struct.pack("<IIffI", 
            g["opcode"], g["stratum"], g["p1"], g["p2"], g["target"]
        ))
        
    output_path = "systems/glyph_stratum/coin_flip_test.bin"
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "wb") as f:
        f.write(binary_data)
        
    print(f"Generated {len(program)} glyphs to {output_path}")
    return program

if __name__ == "__main__":
    generate_coin_flip_program()

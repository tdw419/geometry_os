import json
import numpy as np

# Opcodes
MOV = 206
LD = 204
INT_DISPATCH = 218
ADD_MEM = 216
JZ = 209
DRAW = 215
HALT = 212

# Memory Map
MOUSE_X = 0
MOUSE_Y = 1
MOUSE_BTN = 2
MOUSE_DX = 3
MOUSE_DY = 4

WIN_X = 10
WIN_Y = 11
WIN_W = 12
WIN_H = 13
HIT_FLAG = 14

HIT_TABLE_START = 20

# Initial Memory
memory = [0.0] * 1024
memory[WIN_X] = 100.0
memory[WIN_Y] = 100.0
memory[WIN_W] = 300.0
memory[WIN_H] = 200.0

# Hit Table (X, Y, W, H, ID)
memory[HIT_TABLE_START:HIT_TABLE_START+5] = [WIN_X, WIN_Y, WIN_W, WIN_H, 1.0]

# Program (list of [opcode, stratum, p1, p2, target])
program = [
    [MOV, 0, 14, 0.0, 14],            # 0: memory[14] = 0.0 (Clear Hit Flag)
    # Update hit table with current window positions (dynamic)
    [LD,  0, 20, 10, 20],             # 1: memory[20] = memory[10] (Update X)
    [LD,  0, 21, 11, 21],             # 2: memory[21] = memory[11] (Update Y)
    
    [INT_DISPATCH, 0, 20.0, 1.0, 14], # 3: Scan table at 20 (1 entry), result in 14
    [JZ, 0, 0.0, 0.0, 14],            # 4: if hit_flag == 0, jump to 6 (JZ pc = p1)
    
    # Drag logic: WIN_X += MOUSE_DX, WIN_Y += MOUSE_DY
    [ADD_MEM, 0, 10.0, 3.0, 10],      # 5: WIN_X = WIN_X + MOUSE_DX
    [ADD_MEM, 0, 11.0, 4.0, 11],      # 6: WIN_Y = WIN_Y + MOUSE_DY
    
    # Draw Window (glyph 65)
    [DRAW, 0, 65.0, 10.0, 11],        # 7: DRAW(glyph_id=65, x=memory[10], y=memory[11])
    [HALT, 0, 0.0, 0.0, 0],           # 8: HALT
]

# Set jump targets
program[4][2] = 7 # JZ targets instruction 7 (DRAW)

# Save as JSON for the Rust side to load
payload = {
    "program": program,
    "memory": memory,
    "version": "native-glyph-v1"
}

with open("systems/glyph_stratum/native_window_program.json", "w") as f:
    json.dump(payload, f, indent=2)

print("✅ Native Glyph Window Program generated: systems/glyph_stratum/native_window_program.json")

; DESCRIPTION: Composite: Draws a red line from (392, 85) to (164, 210) then Sets a single white pixel at (242, 235) then Places a blue 64x107 rectangle at position (227, 81).
; PLAN: r0=392(x1), r1=85(y1), r2=164(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=235(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=81(y), r12=64(width), r13=107(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 85
LDI r2, 164
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 235
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 227
LDI r11, 81
LDI r12, 64
LDI r13, 107
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT

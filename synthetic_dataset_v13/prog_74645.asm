; DESCRIPTION: Composite: Places a orange line segment connecting (12, 179) to (367, 48) then Sets a single white pixel at (426, 203) then Places a black 30x32 rectangle at position (51, 149).
; PLAN: r0=12(x1), r1=179(y1), r2=367(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=203(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=149(y), r12=30(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 179
LDI r2, 367
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 203
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 149
LDI r12, 30
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

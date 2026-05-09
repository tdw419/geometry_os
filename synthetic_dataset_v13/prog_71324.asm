; DESCRIPTION: Composite: Places a black dot at position (257, 105) then Places a orange line segment connecting (399, 28) to (511, 133) then Draws a purple rectangle at (115, 5) with width 70 and height 42.
; PLAN: r0=257(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=28(y1), r7=511(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=5(y), r12=70(width), r13=42(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 399
LDI r6, 28
LDI r7, 511
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 5
LDI r12, 70
LDI r13, 42
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

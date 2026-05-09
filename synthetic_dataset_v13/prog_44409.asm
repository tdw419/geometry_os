; DESCRIPTION: Composite: Places a black 45x98 rectangle at position (44, 156) then Sets a single purple pixel at (407, 179) then Places a red circle of radius 77 at center (135, 115).
; PLAN: r0=44(x), r1=156(y), r2=45(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=179(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=115(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 156
LDI r2, 45
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 179
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 115
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

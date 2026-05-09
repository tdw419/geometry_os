; DESCRIPTION: Composite: Renders a green line between points (366, 71) and (179, 24) then Sets a single yellow pixel at (345, 123) then Places a white 76x101 rectangle at position (226, 85).
; PLAN: r0=366(x1), r1=71(y1), r2=179(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=226(x), r11=85(y), r12=76(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 71
LDI r2, 179
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 226
LDI r11, 85
LDI r12, 76
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Places a white 62x33 rectangle at position (268, 146) then Renders a black line between points (95, 14) and (357, 49) then Sets a single yellow pixel at (321, 53).
; PLAN: r0=268(x), r1=146(y), r2=62(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=14(y1), r7=357(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=53(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 146
LDI r2, 62
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 14
LDI r7, 357
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 53
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

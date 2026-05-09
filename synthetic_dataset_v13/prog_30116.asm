; DESCRIPTION: Composite: Places a magenta line segment connecting (227, 31) to (319, 45) then Sets a single yellow pixel at (318, 94) then Creates a red rectangular region at (139, 91) spanning 28 by 115 pixels.
; PLAN: r0=227(x1), r1=31(y1), r2=319(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=94(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=139(x), r11=91(y), r12=28(width), r13=115(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 31
LDI r2, 319
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 94
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 139
LDI r11, 91
LDI r12, 28
LDI r13, 115
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

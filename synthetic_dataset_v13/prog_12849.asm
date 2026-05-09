; DESCRIPTION: Composite: Renders a magenta line between points (135, 176) and (16, 201) then Creates a orange rectangular region at (483, 61) spanning 26 by 14 pixels then Sets a single yellow pixel at (232, 144).
; PLAN: r0=135(x1), r1=176(y1), r2=16(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=61(y), r7=26(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x), r11=144(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 176
LDI r2, 16
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 61
LDI r7, 26
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 144
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

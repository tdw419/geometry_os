; DESCRIPTION: Composite: Renders a magenta line between points (31, 207) and (427, 169) then Sets a single black pixel at (270, 104) then Draws a magenta circle centered at (252, 102) with radius 77.
; PLAN: r0=31(x1), r1=207(y1), r2=427(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=104(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=102(y), r12=77(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 207
LDI r2, 427
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 104
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 252
LDI r11, 102
LDI r12, 77
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Renders a orange line between points (16, 109) and (325, 246) then Sets a single blue pixel at (26, 251) then Draws a blue circle centered at (469, 128) with radius 15.
; PLAN: r0=16(x1), r1=109(y1), r2=325(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=251(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=128(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 16
LDI r1, 109
LDI r2, 325
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 251
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 469
LDI r11, 128
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

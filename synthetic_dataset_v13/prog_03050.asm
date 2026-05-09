; DESCRIPTION: Composite: Places a black line segment connecting (444, 30) to (495, 204) then Sets a single blue pixel at (157, 163) then Draws a orange circle centered at (54, 73) with radius 28.
; PLAN: r0=444(x1), r1=30(y1), r2=495(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=73(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 30
LDI r2, 495
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 73
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

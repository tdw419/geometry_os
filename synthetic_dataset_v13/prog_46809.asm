; DESCRIPTION: Composite: Places a magenta line segment connecting (501, 6) to (111, 172) then Sets a single blue pixel at (189, 128) then Renders a blue disk with center (430, 161) and radius 76.
; PLAN: r0=501(x1), r1=6(y1), r2=111(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=128(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=161(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 6
LDI r2, 111
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 128
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 430
LDI r11, 161
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT

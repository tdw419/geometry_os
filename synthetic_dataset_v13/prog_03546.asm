; DESCRIPTION: Composite: Places a magenta line segment connecting (489, 69) to (351, 56) then Sets a single black pixel at (17, 73) then Draws a purple circle centered at (166, 211) with radius 31.
; PLAN: r0=489(x1), r1=69(y1), r2=351(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=73(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=211(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 69
LDI r2, 351
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 73
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 166
LDI r11, 211
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

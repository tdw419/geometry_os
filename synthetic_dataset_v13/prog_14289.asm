; DESCRIPTION: Composite: Draws a purple line from (109, 166) to (87, 62) then Places a black dot at position (398, 140) then Draws a black circle centered at (381, 211) with radius 23.
; PLAN: r0=109(x1), r1=166(y1), r2=87(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=140(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=381(x), r11=211(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 166
LDI r2, 87
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 140
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 381
LDI r11, 211
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

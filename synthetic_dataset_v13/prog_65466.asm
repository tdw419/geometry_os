; DESCRIPTION: Composite: Draws a black line from (462, 43) to (506, 201) then Places a black circle of radius 15 at center (202, 192) then Sets a single yellow pixel at (89, 227).
; PLAN: r0=462(x1), r1=43(y1), r2=506(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=192(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 462
LDI r1, 43
LDI r2, 506
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 192
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

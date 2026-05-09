; DESCRIPTION: Composite: Places a black line segment connecting (297, 89) to (212, 229) then Places a blue dot at position (268, 101) then Draws a yellow circle centered at (375, 35) with radius 33.
; PLAN: r0=297(x1), r1=89(y1), r2=212(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=35(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 89
LDI r2, 212
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 375
LDI r11, 35
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

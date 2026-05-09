; DESCRIPTION: Composite: Draws a white line from (49, 179) to (389, 159) then Places a yellow dot at position (511, 60) then Draws a black circle centered at (287, 62) with radius 56.
; PLAN: r0=49(x1), r1=179(y1), r2=389(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=62(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 179
LDI r2, 389
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 287
LDI r11, 62
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

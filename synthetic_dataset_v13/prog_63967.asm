; DESCRIPTION: Composite: Sets a single red pixel at (97, 183) then Renders a orange line between points (54, 119) and (341, 102) then Draws a white circle centered at (258, 132) with radius 62.
; PLAN: r0=97(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=119(y1), r7=341(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=132(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 54
LDI r6, 119
LDI r7, 341
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 132
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

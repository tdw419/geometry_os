; DESCRIPTION: Composite: Sets a single red pixel at (287, 169) then Draws a green line from (292, 102) to (236, 105) then Draws a purple circle centered at (293, 57) with radius 23.
; PLAN: r0=287(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=102(y1), r7=236(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=57(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 169
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 292
LDI r6, 102
LDI r7, 236
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 57
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

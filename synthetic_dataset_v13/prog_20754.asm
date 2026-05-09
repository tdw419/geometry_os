; DESCRIPTION: Composite: Places a green line segment connecting (442, 218) to (241, 251) then Draws a yellow circle centered at (423, 85) with radius 79.
; PLAN: r0=442(x1), r1=218(y1), r2=241(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=85(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 218
LDI r2, 241
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 85
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

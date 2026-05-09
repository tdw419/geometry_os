; DESCRIPTION: Composite: Places a white line segment connecting (12, 167) to (419, 229) then Sets a single white pixel at (44, 75) then Creates a orange circular shape at (220, 78) with radius 69.
; PLAN: r0=12(x1), r1=167(y1), r2=419(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=75(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=78(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 167
LDI r2, 419
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 75
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 78
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

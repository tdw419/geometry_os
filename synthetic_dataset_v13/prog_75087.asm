; DESCRIPTION: Composite: Places a white line segment connecting (489, 163) to (98, 216) then Sets a single yellow pixel at (303, 219) then Creates a white circular shape at (220, 99) with radius 53.
; PLAN: r0=489(x1), r1=163(y1), r2=98(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=99(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 163
LDI r2, 98
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 220
LDI r11, 99
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

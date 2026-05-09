; DESCRIPTION: Composite: Places a purple line segment connecting (369, 61) to (338, 170) then Sets a single red pixel at (170, 233) then Creates a purple circular shape at (112, 158) with radius 26.
; PLAN: r0=369(x1), r1=61(y1), r2=338(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=233(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=158(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 61
LDI r2, 338
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 233
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 112
LDI r11, 158
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT

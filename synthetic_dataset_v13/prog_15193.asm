; DESCRIPTION: Composite: Places a purple line segment connecting (65, 155) to (486, 49) then Places a purple circle of radius 10 at center (338, 23).
; PLAN: r0=65(x1), r1=155(y1), r2=486(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=23(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 65
LDI r1, 155
LDI r2, 486
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 23
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a purple line segment connecting (105, 232) to (429, 201) then Creates a purple circular shape at (90, 96) with radius 79.
; PLAN: r0=105(x1), r1=232(y1), r2=429(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=96(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 232
LDI r2, 429
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 96
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

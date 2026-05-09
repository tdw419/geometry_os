; DESCRIPTION: Composite: Places a magenta line segment connecting (422, 145) to (507, 201) then Creates a purple circular shape at (131, 130) with radius 43.
; PLAN: r0=422(x1), r1=145(y1), r2=507(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=130(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 145
LDI r2, 507
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 130
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

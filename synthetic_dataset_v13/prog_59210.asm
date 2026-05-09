; DESCRIPTION: Composite: Places a orange line segment connecting (199, 137) to (214, 142) then Sets a single blue pixel at (390, 6).
; PLAN: r0=199(x1), r1=137(y1), r2=214(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=6(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 137
LDI r2, 214
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 6
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

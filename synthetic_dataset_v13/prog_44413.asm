; DESCRIPTION: Composite: Places a orange line segment connecting (6, 17) to (237, 212) then Sets a single blue pixel at (285, 155).
; PLAN: r0=6(x1), r1=17(y1), r2=237(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=155(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 17
LDI r2, 237
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 155
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

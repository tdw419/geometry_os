; DESCRIPTION: Composite: Places a black line segment connecting (457, 17) to (367, 232) then Sets a single blue pixel at (117, 185).
; PLAN: r0=457(x1), r1=17(y1), r2=367(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 17
LDI r2, 367
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Draws a green circle centered at (118, 177) with radius 79 then Sets a single blue pixel at (451, 52).
; PLAN: r0=118(x), r1=177(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=52(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 177
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 52
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

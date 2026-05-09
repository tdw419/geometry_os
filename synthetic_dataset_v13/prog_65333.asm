; DESCRIPTION: Composite: Creates a green circular shape at (390, 144) with radius 64 then Sets a single blue pixel at (140, 227).
; PLAN: r0=390(x), r1=144(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=227(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 144
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 227
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

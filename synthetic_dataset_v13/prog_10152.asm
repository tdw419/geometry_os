; DESCRIPTION: Composite: Creates a purple circular shape at (280, 137) with radius 39 then Sets a single blue pixel at (318, 251).
; PLAN: r0=280(x), r1=137(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=251(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 137
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 251
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

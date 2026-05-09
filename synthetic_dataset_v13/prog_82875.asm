; DESCRIPTION: Composite: Creates a black circular shape at (405, 77) with radius 63 then Sets a single purple pixel at (447, 75).
; PLAN: r0=405(x), r1=77(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=75(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 77
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 75
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

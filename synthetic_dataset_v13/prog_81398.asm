; DESCRIPTION: Composite: Places a white circle of radius 45 at center (321, 128) then Sets a single blue pixel at (348, 11).
; PLAN: r0=321(x), r1=128(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=11(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 128
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 11
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

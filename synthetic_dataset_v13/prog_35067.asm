; DESCRIPTION: Composite: Places a black circle of radius 46 at center (448, 183) then Sets a single green pixel at (348, 135).
; PLAN: r0=448(x), r1=183(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=135(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 183
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 135
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

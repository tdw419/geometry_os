; DESCRIPTION: Composite: Draws a black circle centered at (297, 122) with radius 60 then Sets a single black pixel at (348, 211).
; PLAN: r0=297(x), r1=122(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=211(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 122
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 211
LDI r7, 0x000000
PSET r5, r6, r7
HALT

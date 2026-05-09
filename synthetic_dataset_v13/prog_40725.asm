; DESCRIPTION: Composite: Renders a white disk with center (381, 141) and radius 52 then Sets a single red pixel at (297, 49).
; PLAN: r0=381(x), r1=141(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=49(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 141
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 49
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

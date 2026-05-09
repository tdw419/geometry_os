; DESCRIPTION: Composite: Places a blue circle of radius 31 at center (348, 172) then Sets a single orange pixel at (389, 186).
; PLAN: r0=348(x), r1=172(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 172
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

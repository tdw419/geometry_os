; DESCRIPTION: Composite: Creates a black circular shape at (100, 74) with radius 27 then Places a black dot at position (348, 194).
; PLAN: r0=100(x), r1=74(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 74
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
HALT

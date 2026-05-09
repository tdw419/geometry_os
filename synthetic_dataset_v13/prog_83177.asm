; DESCRIPTION: Composite: Sets a single orange pixel at (348, 24) then Creates a orange circular shape at (421, 148) with radius 74.
; PLAN: r0=348(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=148(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 421
LDI r6, 148
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

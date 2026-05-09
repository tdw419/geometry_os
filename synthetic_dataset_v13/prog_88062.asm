; DESCRIPTION: Composite: Creates a orange circular shape at (270, 79) with radius 33 then Sets a single red pixel at (348, 0).
; PLAN: r0=270(x), r1=79(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=0(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 79
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 0
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

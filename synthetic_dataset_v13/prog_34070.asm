; DESCRIPTION: Composite: Creates a black circular shape at (358, 219) with radius 11 then Places a orange dot at position (315, 124).
; PLAN: r0=358(x), r1=219(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=124(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 219
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 124
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

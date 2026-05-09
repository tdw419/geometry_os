; DESCRIPTION: Composite: Creates a cyan circular shape at (491, 79) with radius 19 then Places a orange dot at position (483, 78).
; PLAN: r0=491(x), r1=79(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=78(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 491
LDI r1, 79
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 78
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

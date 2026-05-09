; DESCRIPTION: Composite: Sets a single orange pixel at (380, 46) then Creates a orange circular shape at (183, 155) with radius 43.
; PLAN: r0=380(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=155(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 380
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 183
LDI r6, 155
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

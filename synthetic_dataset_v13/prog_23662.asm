; DESCRIPTION: Composite: Places a black dot at position (461, 2) then Creates a red circular shape at (86, 76) with radius 39.
; PLAN: r0=461(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=76(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 86
LDI r6, 76
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

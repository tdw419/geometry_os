; DESCRIPTION: Composite: Places a orange dot at position (93, 232) then Draws a orange circle centered at (238, 105) with radius 71.
; PLAN: r0=93(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=105(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 238
LDI r6, 105
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

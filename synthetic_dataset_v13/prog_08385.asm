; DESCRIPTION: Composite: Places a purple dot at position (71, 35) then Draws a orange circle centered at (163, 126) with radius 41.
; PLAN: r0=71(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=126(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 126
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

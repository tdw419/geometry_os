; DESCRIPTION: Composite: Places a orange dot at position (41, 185) then Draws a orange circle centered at (276, 68) with radius 49.
; PLAN: r0=41(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=68(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 185
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 276
LDI r6, 68
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a white dot at position (53, 51) then Draws a orange circle centered at (252, 134) with radius 45.
; PLAN: r0=53(x), r1=51(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=134(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 51
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 134
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a white dot at position (349, 227) then Draws a orange circle centered at (156, 153) with radius 75.
; PLAN: r0=349(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=153(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 153
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

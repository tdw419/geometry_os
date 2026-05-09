; DESCRIPTION: Composite: Draws a blue circle centered at (102, 121) with radius 36 then Places a blue dot at position (85, 199).
; PLAN: r0=102(x), r1=121(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=199(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 121
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 199
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

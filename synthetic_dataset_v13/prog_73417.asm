; DESCRIPTION: Composite: Draws a blue circle centered at (334, 107) with radius 11 then Places a blue dot at position (121, 199).
; PLAN: r0=334(x), r1=107(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=199(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 107
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 199
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

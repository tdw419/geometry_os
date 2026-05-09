; DESCRIPTION: Composite: Creates a blue circular shape at (319, 156) with radius 78 then Places a black dot at position (232, 104).
; PLAN: r0=319(x), r1=156(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=104(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 156
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 104
LDI r7, 0x000000
PSET r5, r6, r7
HALT

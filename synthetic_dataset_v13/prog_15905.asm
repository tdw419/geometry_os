; DESCRIPTION: Composite: Creates a black circular shape at (76, 156) with radius 35 then Places a blue dot at position (249, 105).
; PLAN: r0=76(x), r1=156(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 156
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

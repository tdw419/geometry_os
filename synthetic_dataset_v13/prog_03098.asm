; DESCRIPTION: Composite: Draws a black circle centered at (311, 184) with radius 52 then Places a red dot at position (3, 217).
; PLAN: r0=311(x), r1=184(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=217(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 184
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 217
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

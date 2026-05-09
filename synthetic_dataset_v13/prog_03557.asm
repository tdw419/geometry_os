; DESCRIPTION: Composite: Creates a black circular shape at (162, 155) with radius 72 then Places a black dot at position (94, 105).
; PLAN: r0=162(x), r1=155(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=105(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 155
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 105
LDI r7, 0x000000
PSET r5, r6, r7
HALT

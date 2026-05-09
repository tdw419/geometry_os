; DESCRIPTION: Composite: Draws a purple circle centered at (134, 155) with radius 32 then Sets a single black pixel at (308, 122).
; PLAN: r0=134(x), r1=155(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 155
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
HALT

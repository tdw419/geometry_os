; DESCRIPTION: Composite: Creates a black circular shape at (159, 184) with radius 69 then Sets a single black pixel at (171, 54).
; PLAN: r0=159(x), r1=184(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=54(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 184
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 54
LDI r7, 0x000000
PSET r5, r6, r7
HALT

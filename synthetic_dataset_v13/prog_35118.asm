; DESCRIPTION: Composite: Creates a black circular shape at (100, 78) with radius 71 then Places a purple dot at position (53, 131).
; PLAN: r0=100(x), r1=78(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=131(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 78
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 131
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

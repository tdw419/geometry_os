; DESCRIPTION: Composite: Places a blue dot at position (266, 89) then Creates a purple circular shape at (179, 101) with radius 62.
; PLAN: r0=266(x), r1=89(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=101(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 89
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 101
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

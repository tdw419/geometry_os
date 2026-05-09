; DESCRIPTION: Composite: Places a yellow dot at position (463, 201) then Creates a black circular shape at (227, 189) with radius 41.
; PLAN: r0=463(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=189(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 463
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 227
LDI r6, 189
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

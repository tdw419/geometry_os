; DESCRIPTION: Composite: Places a orange dot at position (227, 169) then Creates a black circular shape at (74, 48) with radius 28.
; PLAN: r0=227(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=48(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 74
LDI r6, 48
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

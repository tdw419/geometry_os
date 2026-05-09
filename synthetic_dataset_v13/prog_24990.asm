; DESCRIPTION: Composite: Places a white dot at position (203, 110) then Creates a black circular shape at (22, 183) with radius 13.
; PLAN: r0=203(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=183(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 22
LDI r6, 183
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

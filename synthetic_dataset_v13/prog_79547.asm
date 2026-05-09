; DESCRIPTION: Composite: Sets a single black pixel at (11, 148) then Creates a orange circular shape at (373, 78) with radius 78.
; PLAN: r0=11(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=78(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 78
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

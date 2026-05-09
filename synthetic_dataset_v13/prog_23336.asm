; DESCRIPTION: Composite: Sets a single green pixel at (142, 3) then Creates a black circular shape at (332, 163) with radius 33.
; PLAN: r0=142(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=163(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 332
LDI r6, 163
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

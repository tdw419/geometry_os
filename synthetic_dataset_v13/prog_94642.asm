; DESCRIPTION: Composite: Sets a single red pixel at (507, 201) then Draws a black circle centered at (377, 83) with radius 47.
; PLAN: r0=507(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=83(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 377
LDI r6, 83
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

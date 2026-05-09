; DESCRIPTION: Composite: Places a white dot at position (9, 153) then Renders a black disk with center (200, 139) and radius 78.
; PLAN: r0=9(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=139(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 139
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

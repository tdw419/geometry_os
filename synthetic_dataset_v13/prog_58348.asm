; DESCRIPTION: Composite: Sets a single yellow pixel at (62, 231) then Renders a white disk with center (105, 227) and radius 13.
; PLAN: r0=62(x), r1=231(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=227(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 231
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 105
LDI r6, 227
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

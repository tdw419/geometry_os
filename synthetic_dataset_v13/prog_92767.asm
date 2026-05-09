; DESCRIPTION: Composite: Renders a white disk with center (119, 141) and radius 78 then Sets a single red pixel at (115, 222).
; PLAN: r0=119(x), r1=141(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=222(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 141
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 222
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Renders a black disk with center (319, 68) and radius 66 then Sets a single orange pixel at (33, 158).
; PLAN: r0=319(x), r1=68(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 68
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

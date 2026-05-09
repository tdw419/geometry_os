; DESCRIPTION: Composite: Creates a green circular shape at (137, 125) with radius 31 then Sets a single purple pixel at (220, 183).
; PLAN: r0=137(x), r1=125(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=183(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 125
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 183
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

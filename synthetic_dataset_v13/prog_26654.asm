; DESCRIPTION: Composite: Creates a blue circular shape at (270, 115) with radius 57 then Sets a single black pixel at (457, 141).
; PLAN: r0=270(x), r1=115(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=141(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 115
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 141
LDI r7, 0x000000
PSET r5, r6, r7
HALT

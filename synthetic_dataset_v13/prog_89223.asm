; DESCRIPTION: Composite: Creates a green circular shape at (77, 93) with radius 66 then Sets a single green pixel at (158, 80).
; PLAN: r0=77(x), r1=93(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=80(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 93
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 80
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

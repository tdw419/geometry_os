; DESCRIPTION: Composite: Creates a blue circular shape at (89, 169) with radius 34 then Sets a single yellow pixel at (334, 97).
; PLAN: r0=89(x), r1=169(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 169
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Creates a white circular shape at (132, 81) with radius 26 then Sets a single yellow pixel at (442, 78).
; PLAN: r0=132(x), r1=81(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=78(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 81
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 78
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

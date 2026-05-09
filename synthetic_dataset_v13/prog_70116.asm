; DESCRIPTION: Composite: Creates a black circular shape at (334, 160) with radius 61 then Sets a single white pixel at (162, 123).
; PLAN: r0=334(x), r1=160(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=123(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 160
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 123
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

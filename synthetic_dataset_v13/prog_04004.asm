; DESCRIPTION: Composite: Renders a yellow disk with center (361, 100) and radius 20 then Sets a single white pixel at (483, 162).
; PLAN: r0=361(x), r1=100(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 100
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

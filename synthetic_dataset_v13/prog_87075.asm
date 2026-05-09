; DESCRIPTION: Composite: Places a yellow line segment connecting (19, 7) to (274, 158) then Sets a single white pixel at (238, 2).
; PLAN: r0=19(x1), r1=7(y1), r2=274(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=2(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 7
LDI r2, 274
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 2
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

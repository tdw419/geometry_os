; DESCRIPTION: Composite: Places a purple line segment connecting (407, 25) to (115, 46) then Sets a single white pixel at (292, 112).
; PLAN: r0=407(x1), r1=25(y1), r2=115(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 25
LDI r2, 115
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

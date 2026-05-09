; DESCRIPTION: Composite: Places a red line segment connecting (6, 75) to (106, 31) then Sets a single white pixel at (118, 124).
; PLAN: r0=6(x1), r1=75(y1), r2=106(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=124(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 75
LDI r2, 106
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 124
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

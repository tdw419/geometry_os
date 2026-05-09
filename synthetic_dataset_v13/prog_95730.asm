; DESCRIPTION: Composite: Sets a single white pixel at (102, 100) then Draws a purple line from (93, 95) to (3, 89).
; PLAN: r0=102(x), r1=100(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=95(y1), r7=3(x2), r8=89(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 100
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 95
LDI r7, 3
LDI r8, 89
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

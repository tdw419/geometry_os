; DESCRIPTION: Places a purple line segment connecting (131, 182) to (343, 74).
; PLAN: r0=131(x1), r1=182(y1), r2=343(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 182
LDI r2, 343
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

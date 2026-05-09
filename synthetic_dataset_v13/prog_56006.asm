; DESCRIPTION: Places a red line segment connecting (468, 213) to (343, 74).
; PLAN: r0=468(x1), r1=213(y1), r2=343(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 213
LDI r2, 343
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (233, 131) to (11, 97).
; PLAN: r0=233(x1), r1=131(y1), r2=11(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 131
LDI r2, 11
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

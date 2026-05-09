; DESCRIPTION: Places a red line segment connecting (366, 106) to (74, 61).
; PLAN: r0=366(x1), r1=106(y1), r2=74(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 106
LDI r2, 74
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

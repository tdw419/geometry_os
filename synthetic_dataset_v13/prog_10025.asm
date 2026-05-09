; DESCRIPTION: Places a red line segment connecting (119, 175) to (131, 52).
; PLAN: r0=119(x1), r1=175(y1), r2=131(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 175
LDI r2, 131
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

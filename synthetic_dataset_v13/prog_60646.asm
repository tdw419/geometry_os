; DESCRIPTION: Places a red line segment connecting (314, 12) to (419, 95).
; PLAN: r0=314(x1), r1=12(y1), r2=419(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 12
LDI r2, 419
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (419, 198) to (423, 54).
; PLAN: r0=419(x1), r1=198(y1), r2=423(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 198
LDI r2, 423
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

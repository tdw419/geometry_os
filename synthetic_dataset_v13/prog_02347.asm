; DESCRIPTION: Renders a orange line between points (484, 194) and (314, 202).
; PLAN: r0=484(x1), r1=194(y1), r2=314(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 194
LDI r2, 314
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

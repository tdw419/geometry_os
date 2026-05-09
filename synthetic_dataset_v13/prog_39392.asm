; DESCRIPTION: Renders a blue line between points (2, 80) and (484, 34).
; PLAN: r0=2(x1), r1=80(y1), r2=484(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 80
LDI r2, 484
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

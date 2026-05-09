; DESCRIPTION: Places a purple line segment connecting (423, 180) to (250, 216).
; PLAN: r0=423(x1), r1=180(y1), r2=250(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 180
LDI r2, 250
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

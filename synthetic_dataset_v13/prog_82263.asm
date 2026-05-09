; DESCRIPTION: Places a purple line segment connecting (47, 153) to (473, 119).
; PLAN: r0=47(x1), r1=153(y1), r2=473(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 153
LDI r2, 473
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

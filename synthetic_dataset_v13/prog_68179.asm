; DESCRIPTION: Places a purple line segment connecting (194, 25) to (29, 119).
; PLAN: r0=194(x1), r1=25(y1), r2=29(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 25
LDI r2, 29
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

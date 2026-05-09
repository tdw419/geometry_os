; DESCRIPTION: Places a purple line segment connecting (29, 194) to (118, 145).
; PLAN: r0=29(x1), r1=194(y1), r2=118(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 194
LDI r2, 118
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

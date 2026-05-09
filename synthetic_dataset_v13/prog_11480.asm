; DESCRIPTION: Places a purple line segment connecting (119, 53) to (489, 31).
; PLAN: r0=119(x1), r1=53(y1), r2=489(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 489
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

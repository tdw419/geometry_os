; DESCRIPTION: Places a purple line segment connecting (489, 148) to (381, 18).
; PLAN: r0=489(x1), r1=148(y1), r2=381(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 148
LDI r2, 381
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

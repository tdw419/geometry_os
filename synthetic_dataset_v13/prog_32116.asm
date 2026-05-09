; DESCRIPTION: Places a purple line segment connecting (414, 31) to (287, 142).
; PLAN: r0=414(x1), r1=31(y1), r2=287(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 31
LDI r2, 287
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

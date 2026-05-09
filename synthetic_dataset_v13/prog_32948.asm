; DESCRIPTION: Places a purple line segment connecting (287, 33) to (89, 181).
; PLAN: r0=287(x1), r1=33(y1), r2=89(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 33
LDI r2, 89
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

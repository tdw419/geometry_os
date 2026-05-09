; DESCRIPTION: Places a purple line segment connecting (130, 227) to (73, 25).
; PLAN: r0=130(x1), r1=227(y1), r2=73(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 227
LDI r2, 73
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

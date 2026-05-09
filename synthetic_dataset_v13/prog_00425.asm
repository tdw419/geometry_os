; DESCRIPTION: Places a purple line segment connecting (73, 227) to (400, 189).
; PLAN: r0=73(x1), r1=227(y1), r2=400(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 227
LDI r2, 400
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (501, 45) to (304, 136).
; PLAN: r0=501(x1), r1=45(y1), r2=304(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 45
LDI r2, 304
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (325, 227) to (326, 88).
; PLAN: r0=325(x1), r1=227(y1), r2=326(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 227
LDI r2, 326
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

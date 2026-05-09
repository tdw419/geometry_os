; DESCRIPTION: Places a purple line segment connecting (36, 38) to (88, 84).
; PLAN: r0=36(x1), r1=38(y1), r2=88(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 38
LDI r2, 88
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

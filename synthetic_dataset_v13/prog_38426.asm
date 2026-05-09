; DESCRIPTION: Places a purple line segment connecting (500, 121) to (137, 34).
; PLAN: r0=500(x1), r1=121(y1), r2=137(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 121
LDI r2, 137
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

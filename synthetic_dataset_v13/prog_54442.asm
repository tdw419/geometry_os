; DESCRIPTION: Places a blue line segment connecting (158, 83) to (336, 135).
; PLAN: r0=158(x1), r1=83(y1), r2=336(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 83
LDI r2, 336
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

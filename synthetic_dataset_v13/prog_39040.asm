; DESCRIPTION: Places a purple line segment connecting (366, 83) to (204, 95).
; PLAN: r0=366(x1), r1=83(y1), r2=204(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 83
LDI r2, 204
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

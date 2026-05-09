; DESCRIPTION: Places a blue line segment connecting (190, 155) to (227, 233).
; PLAN: r0=190(x1), r1=155(y1), r2=227(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 155
LDI r2, 227
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

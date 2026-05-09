; DESCRIPTION: Places a blue line segment connecting (484, 233) to (310, 212).
; PLAN: r0=484(x1), r1=233(y1), r2=310(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 233
LDI r2, 310
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

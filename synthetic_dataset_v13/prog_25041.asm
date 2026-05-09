; DESCRIPTION: Places a blue line segment connecting (200, 52) to (192, 219).
; PLAN: r0=200(x1), r1=52(y1), r2=192(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 52
LDI r2, 192
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

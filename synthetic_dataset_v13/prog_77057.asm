; DESCRIPTION: Places a blue line segment connecting (54, 31) to (151, 219).
; PLAN: r0=54(x1), r1=31(y1), r2=151(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 31
LDI r2, 151
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

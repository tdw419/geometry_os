; DESCRIPTION: Places a blue line segment connecting (501, 3) to (128, 100).
; PLAN: r0=501(x1), r1=3(y1), r2=128(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 3
LDI r2, 128
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

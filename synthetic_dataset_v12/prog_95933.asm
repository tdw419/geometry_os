; DESCRIPTION: Places a blue line segment connecting (128, 184) to (383, 130).
; PLAN: r0=128(x1), r1=184(y1), r2=383(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 184
LDI r2, 383
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (101, 62) to (198, 97).
; PLAN: r0=101(x1), r1=62(y1), r2=198(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 62
LDI r2, 198
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

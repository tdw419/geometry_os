; DESCRIPTION: Places a blue line segment connecting (474, 86) to (204, 97).
; PLAN: r0=474(x1), r1=86(y1), r2=204(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 86
LDI r2, 204
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

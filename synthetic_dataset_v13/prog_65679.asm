; DESCRIPTION: Places a blue line segment connecting (136, 26) to (28, 84).
; PLAN: r0=136(x1), r1=26(y1), r2=28(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 26
LDI r2, 28
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

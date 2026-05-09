; DESCRIPTION: Places a blue line segment connecting (435, 156) to (39, 189).
; PLAN: r0=435(x1), r1=156(y1), r2=39(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 156
LDI r2, 39
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

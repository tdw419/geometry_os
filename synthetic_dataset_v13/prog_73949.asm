; DESCRIPTION: Places a blue line segment connecting (148, 224) to (466, 84).
; PLAN: r0=148(x1), r1=224(y1), r2=466(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 224
LDI r2, 466
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

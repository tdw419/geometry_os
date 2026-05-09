; DESCRIPTION: Places a blue line segment connecting (313, 224) to (163, 114).
; PLAN: r0=313(x1), r1=224(y1), r2=163(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 224
LDI r2, 163
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

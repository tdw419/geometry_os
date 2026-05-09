; DESCRIPTION: Places a purple line segment connecting (163, 18) to (415, 224).
; PLAN: r0=163(x1), r1=18(y1), r2=415(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 18
LDI r2, 415
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

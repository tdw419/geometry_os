; DESCRIPTION: Places a purple line segment connecting (88, 0) to (382, 137).
; PLAN: r0=88(x1), r1=0(y1), r2=382(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 0
LDI r2, 382
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

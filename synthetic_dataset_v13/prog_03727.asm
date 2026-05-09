; DESCRIPTION: Places a purple line segment connecting (453, 65) to (115, 88).
; PLAN: r0=453(x1), r1=65(y1), r2=115(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 65
LDI r2, 115
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

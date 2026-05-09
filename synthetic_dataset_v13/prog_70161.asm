; DESCRIPTION: Places a purple line segment connecting (324, 70) to (136, 123).
; PLAN: r0=324(x1), r1=70(y1), r2=136(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 70
LDI r2, 136
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

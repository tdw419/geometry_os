; DESCRIPTION: Places a purple line segment connecting (237, 84) to (155, 1).
; PLAN: r0=237(x1), r1=84(y1), r2=155(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 84
LDI r2, 155
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

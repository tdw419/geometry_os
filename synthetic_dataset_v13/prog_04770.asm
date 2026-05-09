; DESCRIPTION: Places a purple line segment connecting (390, 33) to (28, 144).
; PLAN: r0=390(x1), r1=33(y1), r2=28(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 33
LDI r2, 28
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

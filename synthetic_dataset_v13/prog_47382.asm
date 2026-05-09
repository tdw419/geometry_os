; DESCRIPTION: Places a purple line segment connecting (84, 97) to (374, 147).
; PLAN: r0=84(x1), r1=97(y1), r2=374(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 97
LDI r2, 374
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

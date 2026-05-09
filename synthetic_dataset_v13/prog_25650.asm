; DESCRIPTION: Places a purple line segment connecting (318, 97) to (130, 7).
; PLAN: r0=318(x1), r1=97(y1), r2=130(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 97
LDI r2, 130
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

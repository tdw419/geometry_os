; DESCRIPTION: Places a purple line segment connecting (318, 26) to (160, 14).
; PLAN: r0=318(x1), r1=26(y1), r2=160(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 26
LDI r2, 160
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

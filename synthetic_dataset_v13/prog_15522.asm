; DESCRIPTION: Places a purple line segment connecting (144, 12) to (62, 248).
; PLAN: r0=144(x1), r1=12(y1), r2=62(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 12
LDI r2, 62
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

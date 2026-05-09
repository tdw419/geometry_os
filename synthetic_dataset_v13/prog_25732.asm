; DESCRIPTION: Places a purple line segment connecting (248, 216) to (144, 39).
; PLAN: r0=248(x1), r1=216(y1), r2=144(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 216
LDI r2, 144
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (201, 40) to (468, 67).
; PLAN: r0=201(x1), r1=40(y1), r2=468(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 40
LDI r2, 468
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

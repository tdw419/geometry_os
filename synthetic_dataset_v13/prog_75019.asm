; DESCRIPTION: Places a purple line segment connecting (67, 157) to (483, 11).
; PLAN: r0=67(x1), r1=157(y1), r2=483(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 157
LDI r2, 483
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

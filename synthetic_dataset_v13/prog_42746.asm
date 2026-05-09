; DESCRIPTION: Places a purple line segment connecting (212, 68) to (261, 90).
; PLAN: r0=212(x1), r1=68(y1), r2=261(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 68
LDI r2, 261
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

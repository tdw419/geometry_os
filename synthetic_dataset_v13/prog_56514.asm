; DESCRIPTION: Places a purple line segment connecting (47, 170) to (304, 9).
; PLAN: r0=47(x1), r1=170(y1), r2=304(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 170
LDI r2, 304
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

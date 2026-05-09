; DESCRIPTION: Places a purple line segment connecting (212, 3) to (261, 104).
; PLAN: r0=212(x1), r1=3(y1), r2=261(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 3
LDI r2, 261
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (486, 234) to (6, 104).
; PLAN: r0=486(x1), r1=234(y1), r2=6(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 234
LDI r2, 6
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

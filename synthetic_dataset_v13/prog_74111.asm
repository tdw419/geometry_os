; DESCRIPTION: Places a purple line segment connecting (67, 172) to (467, 155).
; PLAN: r0=67(x1), r1=172(y1), r2=467(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 172
LDI r2, 467
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

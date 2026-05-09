; DESCRIPTION: Places a purple line segment connecting (252, 109) to (119, 25).
; PLAN: r0=252(x1), r1=109(y1), r2=119(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 109
LDI r2, 119
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

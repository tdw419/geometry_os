; DESCRIPTION: Places a purple line segment connecting (204, 99) to (413, 217).
; PLAN: r0=204(x1), r1=99(y1), r2=413(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 99
LDI r2, 413
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

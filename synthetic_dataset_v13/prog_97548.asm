; DESCRIPTION: Places a purple line segment connecting (407, 119) to (297, 214).
; PLAN: r0=407(x1), r1=119(y1), r2=297(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 119
LDI r2, 297
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

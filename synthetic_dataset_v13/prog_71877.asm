; DESCRIPTION: Places a purple line segment connecting (414, 134) to (459, 22).
; PLAN: r0=414(x1), r1=134(y1), r2=459(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 134
LDI r2, 459
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

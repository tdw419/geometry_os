; DESCRIPTION: Places a purple line segment connecting (109, 38) to (469, 109).
; PLAN: r0=109(x1), r1=38(y1), r2=469(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 38
LDI r2, 469
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

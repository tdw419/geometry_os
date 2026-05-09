; DESCRIPTION: Places a purple line segment connecting (61, 92) to (423, 101).
; PLAN: r0=61(x1), r1=92(y1), r2=423(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 92
LDI r2, 423
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (452, 238) to (172, 133).
; PLAN: r0=452(x1), r1=238(y1), r2=172(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 238
LDI r2, 172
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

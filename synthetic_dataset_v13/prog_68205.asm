; DESCRIPTION: Places a purple line segment connecting (164, 119) to (511, 133).
; PLAN: r0=164(x1), r1=119(y1), r2=511(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 119
LDI r2, 511
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

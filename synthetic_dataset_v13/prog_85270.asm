; DESCRIPTION: Places a purple line segment connecting (139, 238) to (271, 157).
; PLAN: r0=139(x1), r1=238(y1), r2=271(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 238
LDI r2, 271
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (21, 88) to (307, 157).
; PLAN: r0=21(x1), r1=88(y1), r2=307(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 88
LDI r2, 307
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (158, 128) to (456, 18).
; PLAN: r0=158(x1), r1=128(y1), r2=456(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 128
LDI r2, 456
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

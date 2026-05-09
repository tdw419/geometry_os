; DESCRIPTION: Places a purple line segment connecting (430, 233) to (64, 151).
; PLAN: r0=430(x1), r1=233(y1), r2=64(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 233
LDI r2, 64
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

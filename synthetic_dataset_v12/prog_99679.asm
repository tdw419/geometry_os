; DESCRIPTION: Places a purple line segment connecting (114, 64) to (360, 99).
; PLAN: r0=114(x1), r1=64(y1), r2=360(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 64
LDI r2, 360
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

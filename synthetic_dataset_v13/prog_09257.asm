; DESCRIPTION: Places a purple line segment connecting (194, 183) to (8, 47).
; PLAN: r0=194(x1), r1=183(y1), r2=8(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 183
LDI r2, 8
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

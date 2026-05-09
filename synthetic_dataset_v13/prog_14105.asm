; DESCRIPTION: Places a purple line segment connecting (37, 162) to (384, 194).
; PLAN: r0=37(x1), r1=162(y1), r2=384(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 162
LDI r2, 384
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

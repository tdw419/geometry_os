; DESCRIPTION: Places a purple line segment connecting (36, 157) to (134, 187).
; PLAN: r0=36(x1), r1=157(y1), r2=134(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 157
LDI r2, 134
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

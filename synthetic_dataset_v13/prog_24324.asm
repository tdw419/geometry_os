; DESCRIPTION: Places a purple line segment connecting (74, 227) to (276, 172).
; PLAN: r0=74(x1), r1=227(y1), r2=276(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 227
LDI r2, 276
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (278, 246) to (297, 233).
; PLAN: r0=278(x1), r1=246(y1), r2=297(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 246
LDI r2, 297
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

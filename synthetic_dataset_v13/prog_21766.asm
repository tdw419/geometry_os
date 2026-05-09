; DESCRIPTION: Places a purple line segment connecting (297, 39) to (29, 229).
; PLAN: r0=297(x1), r1=39(y1), r2=29(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 39
LDI r2, 29
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

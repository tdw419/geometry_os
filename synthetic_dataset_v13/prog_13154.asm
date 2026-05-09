; DESCRIPTION: Draws a purple line from (57, 30) to (287, 158).
; PLAN: r0=57(x1), r1=30(y1), r2=287(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 287
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

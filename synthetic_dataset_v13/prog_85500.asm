; DESCRIPTION: Draws a purple line from (471, 252) to (167, 158).
; PLAN: r0=471(x1), r1=252(y1), r2=167(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 252
LDI r2, 167
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

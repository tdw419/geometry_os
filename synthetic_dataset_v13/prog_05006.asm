; DESCRIPTION: Draws a purple line from (432, 252) to (471, 228).
; PLAN: r0=432(x1), r1=252(y1), r2=471(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 252
LDI r2, 471
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

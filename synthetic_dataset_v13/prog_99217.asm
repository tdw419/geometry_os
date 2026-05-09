; DESCRIPTION: Draws a purple line from (432, 143) to (31, 206).
; PLAN: r0=432(x1), r1=143(y1), r2=31(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 143
LDI r2, 31
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (338, 97) to (31, 123).
; PLAN: r0=338(x1), r1=97(y1), r2=31(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 97
LDI r2, 31
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

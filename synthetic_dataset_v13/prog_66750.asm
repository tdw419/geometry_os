; DESCRIPTION: Draws a orange line from (97, 222) to (432, 118).
; PLAN: r0=97(x1), r1=222(y1), r2=432(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 222
LDI r2, 432
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

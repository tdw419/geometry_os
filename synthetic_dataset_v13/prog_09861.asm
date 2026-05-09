; DESCRIPTION: Draws a orange line from (432, 217) to (296, 10).
; PLAN: r0=432(x1), r1=217(y1), r2=296(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 217
LDI r2, 296
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

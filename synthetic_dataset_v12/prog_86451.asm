; DESCRIPTION: Draws a orange line from (97, 233) to (121, 85).
; PLAN: r0=97(x1), r1=233(y1), r2=121(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 233
LDI r2, 121
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

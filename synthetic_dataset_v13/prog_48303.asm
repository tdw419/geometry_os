; DESCRIPTION: Draws a orange line from (54, 167) to (19, 9).
; PLAN: r0=54(x1), r1=167(y1), r2=19(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 167
LDI r2, 19
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

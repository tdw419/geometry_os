; DESCRIPTION: Draws a orange line from (252, 167) to (315, 66).
; PLAN: r0=252(x1), r1=167(y1), r2=315(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 167
LDI r2, 315
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

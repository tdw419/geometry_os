; DESCRIPTION: Draws a orange line from (158, 172) to (303, 34).
; PLAN: r0=158(x1), r1=172(y1), r2=303(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 172
LDI r2, 303
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

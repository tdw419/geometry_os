; DESCRIPTION: Draws a orange line from (292, 118) to (336, 36).
; PLAN: r0=292(x1), r1=118(y1), r2=336(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 118
LDI r2, 336
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (158, 162) to (486, 219).
; PLAN: r0=158(x1), r1=162(y1), r2=486(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 162
LDI r2, 486
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (15, 179) to (31, 136).
; PLAN: r0=15(x1), r1=179(y1), r2=31(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 179
LDI r2, 31
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

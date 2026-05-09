; DESCRIPTION: Draws a orange line from (51, 188) to (137, 2).
; PLAN: r0=51(x1), r1=188(y1), r2=137(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 188
LDI r2, 137
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

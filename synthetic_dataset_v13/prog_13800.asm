; DESCRIPTION: Draws a orange line from (2, 144) to (51, 163).
; PLAN: r0=2(x1), r1=144(y1), r2=51(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 144
LDI r2, 51
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

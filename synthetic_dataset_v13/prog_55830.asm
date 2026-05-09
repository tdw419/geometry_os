; DESCRIPTION: Draws a orange line from (132, 177) to (318, 101).
; PLAN: r0=132(x1), r1=177(y1), r2=318(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 177
LDI r2, 318
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

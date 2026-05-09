; DESCRIPTION: Draws a orange line from (270, 125) to (318, 227).
; PLAN: r0=270(x1), r1=125(y1), r2=318(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 125
LDI r2, 318
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

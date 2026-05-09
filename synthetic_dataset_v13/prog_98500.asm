; DESCRIPTION: Draws a orange line from (157, 100) to (318, 127).
; PLAN: r0=157(x1), r1=100(y1), r2=318(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 100
LDI r2, 318
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

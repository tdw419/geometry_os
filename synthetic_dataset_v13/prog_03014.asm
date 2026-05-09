; DESCRIPTION: Draws a orange line from (318, 123) to (383, 146).
; PLAN: r0=318(x1), r1=123(y1), r2=383(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 123
LDI r2, 383
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

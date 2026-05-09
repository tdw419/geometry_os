; DESCRIPTION: Draws a orange line from (323, 159) to (174, 97).
; PLAN: r0=323(x1), r1=159(y1), r2=174(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 159
LDI r2, 174
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

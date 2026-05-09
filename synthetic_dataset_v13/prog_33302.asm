; DESCRIPTION: Draws a orange line from (36, 75) to (323, 206).
; PLAN: r0=36(x1), r1=75(y1), r2=323(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 75
LDI r2, 323
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

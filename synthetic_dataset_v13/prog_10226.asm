; DESCRIPTION: Draws a orange line from (147, 61) to (275, 97).
; PLAN: r0=147(x1), r1=61(y1), r2=275(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 61
LDI r2, 275
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

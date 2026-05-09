; DESCRIPTION: Draws a orange line from (155, 142) to (439, 52).
; PLAN: r0=155(x1), r1=142(y1), r2=439(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 142
LDI r2, 439
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

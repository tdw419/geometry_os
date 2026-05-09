; DESCRIPTION: Renders a orange line between points (463, 143) and (489, 155).
; PLAN: r0=463(x1), r1=143(y1), r2=489(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 143
LDI r2, 489
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

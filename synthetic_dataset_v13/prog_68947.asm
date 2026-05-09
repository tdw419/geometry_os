; DESCRIPTION: Renders a orange line between points (185, 188) and (489, 4).
; PLAN: r0=185(x1), r1=188(y1), r2=489(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 188
LDI r2, 489
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

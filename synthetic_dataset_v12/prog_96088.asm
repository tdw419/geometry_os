; DESCRIPTION: Renders a orange line between points (359, 65) and (259, 185).
; PLAN: r0=359(x1), r1=65(y1), r2=259(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 65
LDI r2, 259
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

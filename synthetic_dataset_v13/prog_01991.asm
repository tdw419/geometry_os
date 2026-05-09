; DESCRIPTION: Renders a orange line between points (359, 84) and (3, 159).
; PLAN: r0=359(x1), r1=84(y1), r2=3(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 84
LDI r2, 3
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

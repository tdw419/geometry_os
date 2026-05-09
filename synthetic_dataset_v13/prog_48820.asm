; DESCRIPTION: Renders a orange line between points (272, 113) and (359, 170).
; PLAN: r0=272(x1), r1=113(y1), r2=359(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 113
LDI r2, 359
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

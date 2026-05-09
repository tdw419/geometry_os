; DESCRIPTION: Renders a orange line between points (451, 70) and (462, 14).
; PLAN: r0=451(x1), r1=70(y1), r2=462(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 70
LDI r2, 462
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

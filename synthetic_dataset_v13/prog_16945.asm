; DESCRIPTION: Renders a orange line between points (302, 94) and (499, 31).
; PLAN: r0=302(x1), r1=94(y1), r2=499(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 94
LDI r2, 499
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

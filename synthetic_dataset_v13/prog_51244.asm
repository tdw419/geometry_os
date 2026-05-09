; DESCRIPTION: Renders a orange line between points (2, 5) and (359, 46).
; PLAN: r0=2(x1), r1=5(y1), r2=359(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 5
LDI r2, 359
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

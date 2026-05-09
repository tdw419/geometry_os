; DESCRIPTION: Renders a orange line between points (149, 65) and (28, 140).
; PLAN: r0=149(x1), r1=65(y1), r2=28(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 65
LDI r2, 28
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

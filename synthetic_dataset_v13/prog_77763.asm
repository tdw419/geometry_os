; DESCRIPTION: Renders a orange line between points (254, 84) and (133, 216).
; PLAN: r0=254(x1), r1=84(y1), r2=133(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 84
LDI r2, 133
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

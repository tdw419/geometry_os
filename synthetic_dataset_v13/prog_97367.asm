; DESCRIPTION: Renders a orange line between points (485, 169) and (201, 201).
; PLAN: r0=485(x1), r1=169(y1), r2=201(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 169
LDI r2, 201
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

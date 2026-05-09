; DESCRIPTION: Renders a orange line between points (169, 52) and (390, 207).
; PLAN: r0=169(x1), r1=52(y1), r2=390(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 52
LDI r2, 390
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

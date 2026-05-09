; DESCRIPTION: Renders a orange line between points (191, 123) and (33, 79).
; PLAN: r0=191(x1), r1=123(y1), r2=33(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 123
LDI r2, 33
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

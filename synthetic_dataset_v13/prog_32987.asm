; DESCRIPTION: Renders a orange line between points (390, 1) and (155, 253).
; PLAN: r0=390(x1), r1=1(y1), r2=155(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 1
LDI r2, 155
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

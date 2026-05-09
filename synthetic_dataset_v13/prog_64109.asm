; DESCRIPTION: Renders a orange line between points (385, 199) and (232, 201).
; PLAN: r0=385(x1), r1=199(y1), r2=232(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 199
LDI r2, 232
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

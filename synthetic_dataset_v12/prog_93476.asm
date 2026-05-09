; DESCRIPTION: Renders a orange line between points (483, 201) and (222, 53).
; PLAN: r0=483(x1), r1=201(y1), r2=222(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 201
LDI r2, 222
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

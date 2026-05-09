; DESCRIPTION: Renders a orange line between points (483, 47) and (433, 165).
; PLAN: r0=483(x1), r1=47(y1), r2=433(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 47
LDI r2, 433
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

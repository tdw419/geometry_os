; DESCRIPTION: Renders a orange line between points (100, 169) and (430, 141).
; PLAN: r0=100(x1), r1=169(y1), r2=430(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 169
LDI r2, 430
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (41, 169) and (105, 4).
; PLAN: r0=41(x1), r1=169(y1), r2=105(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 169
LDI r2, 105
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

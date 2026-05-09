; DESCRIPTION: Renders a orange line between points (51, 169) and (273, 136).
; PLAN: r0=51(x1), r1=169(y1), r2=273(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 169
LDI r2, 273
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

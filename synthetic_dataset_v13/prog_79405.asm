; DESCRIPTION: Renders a orange line between points (378, 34) and (169, 148).
; PLAN: r0=378(x1), r1=34(y1), r2=169(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 34
LDI r2, 169
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (321, 184) and (323, 130).
; PLAN: r0=321(x1), r1=184(y1), r2=323(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 184
LDI r2, 323
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

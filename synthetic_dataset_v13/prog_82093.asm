; DESCRIPTION: Renders a orange line between points (292, 200) and (323, 44).
; PLAN: r0=292(x1), r1=200(y1), r2=323(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 200
LDI r2, 323
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

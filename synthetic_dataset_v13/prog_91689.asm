; DESCRIPTION: Renders a orange line between points (311, 18) and (323, 9).
; PLAN: r0=311(x1), r1=18(y1), r2=323(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 18
LDI r2, 323
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

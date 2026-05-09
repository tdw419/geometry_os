; DESCRIPTION: Renders a orange line between points (417, 123) and (12, 58).
; PLAN: r0=417(x1), r1=123(y1), r2=12(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 123
LDI r2, 12
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

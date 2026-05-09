; DESCRIPTION: Renders a orange line between points (61, 123) and (170, 229).
; PLAN: r0=61(x1), r1=123(y1), r2=170(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 123
LDI r2, 170
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

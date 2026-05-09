; DESCRIPTION: Renders a orange line between points (94, 253) and (311, 58).
; PLAN: r0=94(x1), r1=253(y1), r2=311(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 253
LDI r2, 311
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

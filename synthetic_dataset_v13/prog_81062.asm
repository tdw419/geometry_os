; DESCRIPTION: Renders a orange line between points (201, 253) and (424, 158).
; PLAN: r0=201(x1), r1=253(y1), r2=424(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 253
LDI r2, 424
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

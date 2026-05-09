; DESCRIPTION: Renders a orange line between points (457, 198) and (414, 115).
; PLAN: r0=457(x1), r1=198(y1), r2=414(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 198
LDI r2, 414
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

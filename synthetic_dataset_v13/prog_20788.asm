; DESCRIPTION: Renders a orange line between points (101, 89) and (117, 191).
; PLAN: r0=101(x1), r1=89(y1), r2=117(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 89
LDI r2, 117
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

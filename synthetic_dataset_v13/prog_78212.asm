; DESCRIPTION: Renders a orange line between points (10, 249) and (304, 158).
; PLAN: r0=10(x1), r1=249(y1), r2=304(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 249
LDI r2, 304
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

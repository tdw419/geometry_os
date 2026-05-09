; DESCRIPTION: Renders a orange line between points (444, 123) and (432, 16).
; PLAN: r0=444(x1), r1=123(y1), r2=432(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 123
LDI r2, 432
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

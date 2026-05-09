; DESCRIPTION: Renders a orange line between points (43, 226) and (444, 62).
; PLAN: r0=43(x1), r1=226(y1), r2=444(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 226
LDI r2, 444
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

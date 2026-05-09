; DESCRIPTION: Renders a orange line between points (444, 99) and (77, 81).
; PLAN: r0=444(x1), r1=99(y1), r2=77(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 99
LDI r2, 77
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

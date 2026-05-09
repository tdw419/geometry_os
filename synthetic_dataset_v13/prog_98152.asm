; DESCRIPTION: Renders a orange line between points (144, 178) and (318, 81).
; PLAN: r0=144(x1), r1=178(y1), r2=318(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 178
LDI r2, 318
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

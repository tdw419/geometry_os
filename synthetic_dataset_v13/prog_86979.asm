; DESCRIPTION: Renders a orange line between points (112, 57) and (318, 74).
; PLAN: r0=112(x1), r1=57(y1), r2=318(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 57
LDI r2, 318
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

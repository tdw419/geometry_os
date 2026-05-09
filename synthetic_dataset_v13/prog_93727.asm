; DESCRIPTION: Renders a orange line between points (144, 61) and (369, 43).
; PLAN: r0=144(x1), r1=61(y1), r2=369(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 61
LDI r2, 369
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

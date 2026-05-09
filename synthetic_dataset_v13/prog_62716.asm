; DESCRIPTION: Renders a orange line between points (369, 101) and (464, 175).
; PLAN: r0=369(x1), r1=101(y1), r2=464(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 101
LDI r2, 464
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

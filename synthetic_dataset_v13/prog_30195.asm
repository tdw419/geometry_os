; DESCRIPTION: Renders a orange line between points (369, 110) and (486, 123).
; PLAN: r0=369(x1), r1=110(y1), r2=486(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 110
LDI r2, 486
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

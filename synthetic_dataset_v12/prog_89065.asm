; DESCRIPTION: Renders a orange line between points (369, 79) and (210, 69).
; PLAN: r0=369(x1), r1=79(y1), r2=210(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 79
LDI r2, 210
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (19, 148) to (369, 130).
; PLAN: r0=19(x1), r1=148(y1), r2=369(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 148
LDI r2, 369
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (15, 148) and (435, 123).
; PLAN: r0=15(x1), r1=148(y1), r2=435(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 148
LDI r2, 435
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

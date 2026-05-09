; DESCRIPTION: Renders a orange line between points (303, 22) and (204, 123).
; PLAN: r0=303(x1), r1=22(y1), r2=204(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 22
LDI r2, 204
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

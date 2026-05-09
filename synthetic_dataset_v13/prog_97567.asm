; DESCRIPTION: Renders a orange line between points (258, 22) and (54, 100).
; PLAN: r0=258(x1), r1=22(y1), r2=54(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 22
LDI r2, 54
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

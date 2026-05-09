; DESCRIPTION: Renders a orange line between points (169, 88) and (339, 38).
; PLAN: r0=169(x1), r1=88(y1), r2=339(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 88
LDI r2, 339
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

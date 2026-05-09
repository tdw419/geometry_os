; DESCRIPTION: Renders a orange line between points (54, 14) and (55, 205).
; PLAN: r0=54(x1), r1=14(y1), r2=55(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 14
LDI r2, 55
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

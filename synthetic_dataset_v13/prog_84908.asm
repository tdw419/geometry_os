; DESCRIPTION: Renders a orange line between points (158, 20) and (14, 217).
; PLAN: r0=158(x1), r1=20(y1), r2=14(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 20
LDI r2, 14
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

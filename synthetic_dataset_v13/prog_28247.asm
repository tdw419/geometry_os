; DESCRIPTION: Renders a orange line between points (143, 158) and (153, 22).
; PLAN: r0=143(x1), r1=158(y1), r2=153(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 158
LDI r2, 153
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

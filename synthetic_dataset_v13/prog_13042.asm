; DESCRIPTION: Renders a orange line between points (39, 123) and (153, 116).
; PLAN: r0=39(x1), r1=123(y1), r2=153(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 123
LDI r2, 153
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

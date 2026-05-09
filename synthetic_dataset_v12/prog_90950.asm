; DESCRIPTION: Renders a yellow line between points (44, 123) and (125, 116).
; PLAN: r0=44(x1), r1=123(y1), r2=125(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 123
LDI r2, 125
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

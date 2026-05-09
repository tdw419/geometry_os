; DESCRIPTION: Renders a blue line between points (312, 172) and (149, 116).
; PLAN: r0=312(x1), r1=172(y1), r2=149(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 172
LDI r2, 149
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

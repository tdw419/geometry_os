; DESCRIPTION: Renders a blue line between points (349, 79) and (343, 129).
; PLAN: r0=349(x1), r1=79(y1), r2=343(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 79
LDI r2, 343
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

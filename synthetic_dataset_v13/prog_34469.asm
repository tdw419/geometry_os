; DESCRIPTION: Renders a blue line between points (165, 123) and (461, 89).
; PLAN: r0=165(x1), r1=123(y1), r2=461(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 123
LDI r2, 461
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

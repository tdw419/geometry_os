; DESCRIPTION: Renders a blue line between points (411, 52) and (165, 155).
; PLAN: r0=411(x1), r1=52(y1), r2=165(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 52
LDI r2, 165
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

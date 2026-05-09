; DESCRIPTION: Renders a blue line between points (266, 27) and (155, 233).
; PLAN: r0=266(x1), r1=27(y1), r2=155(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 27
LDI r2, 155
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

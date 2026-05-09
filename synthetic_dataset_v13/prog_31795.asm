; DESCRIPTION: Renders a blue line between points (233, 11) and (293, 155).
; PLAN: r0=233(x1), r1=11(y1), r2=293(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 11
LDI r2, 293
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

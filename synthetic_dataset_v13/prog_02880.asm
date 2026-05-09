; DESCRIPTION: Renders a blue line between points (170, 30) and (81, 155).
; PLAN: r0=170(x1), r1=30(y1), r2=81(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 30
LDI r2, 81
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (191, 81) and (28, 155).
; PLAN: r0=191(x1), r1=81(y1), r2=28(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 81
LDI r2, 28
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

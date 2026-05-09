; DESCRIPTION: Renders a blue line between points (461, 132) and (119, 191).
; PLAN: r0=461(x1), r1=132(y1), r2=119(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 132
LDI r2, 119
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

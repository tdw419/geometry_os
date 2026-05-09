; DESCRIPTION: Draws a blue line from (159, 238) to (155, 119).
; PLAN: r0=159(x1), r1=238(y1), r2=155(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 238
LDI r2, 155
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

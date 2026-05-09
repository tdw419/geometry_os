; DESCRIPTION: Renders a blue line between points (16, 98) and (159, 217).
; PLAN: r0=16(x1), r1=98(y1), r2=159(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 98
LDI r2, 159
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (170, 17) and (39, 119).
; PLAN: r0=170(x1), r1=17(y1), r2=39(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 17
LDI r2, 39
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

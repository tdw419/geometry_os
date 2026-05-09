; DESCRIPTION: Renders a blue line between points (141, 241) and (270, 11).
; PLAN: r0=141(x1), r1=241(y1), r2=270(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 241
LDI r2, 270
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

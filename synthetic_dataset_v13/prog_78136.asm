; DESCRIPTION: Renders a blue line between points (114, 51) and (20, 149).
; PLAN: r0=114(x1), r1=51(y1), r2=20(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 51
LDI r2, 20
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

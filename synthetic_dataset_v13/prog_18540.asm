; DESCRIPTION: Renders a blue line between points (60, 51) and (181, 158).
; PLAN: r0=60(x1), r1=51(y1), r2=181(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 51
LDI r2, 181
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (505, 112) and (452, 148).
; PLAN: r0=505(x1), r1=112(y1), r2=452(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 112
LDI r2, 452
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

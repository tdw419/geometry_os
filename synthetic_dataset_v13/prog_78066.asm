; DESCRIPTION: Renders a blue line between points (452, 135) and (311, 149).
; PLAN: r0=452(x1), r1=135(y1), r2=311(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 135
LDI r2, 311
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (342, 235) and (311, 85).
; PLAN: r0=342(x1), r1=235(y1), r2=311(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 235
LDI r2, 311
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

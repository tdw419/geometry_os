; DESCRIPTION: Renders a blue line between points (54, 133) and (118, 235).
; PLAN: r0=54(x1), r1=133(y1), r2=118(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 133
LDI r2, 118
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

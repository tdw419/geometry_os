; DESCRIPTION: Renders a magenta line between points (169, 155) and (49, 235).
; PLAN: r0=169(x1), r1=155(y1), r2=49(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 155
LDI r2, 49
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

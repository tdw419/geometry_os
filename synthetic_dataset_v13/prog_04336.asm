; DESCRIPTION: Renders a magenta line between points (89, 114) and (300, 235).
; PLAN: r0=89(x1), r1=114(y1), r2=300(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 114
LDI r2, 300
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

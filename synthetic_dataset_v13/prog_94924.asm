; DESCRIPTION: Renders a blue line between points (420, 180) and (155, 235).
; PLAN: r0=420(x1), r1=180(y1), r2=155(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 180
LDI r2, 155
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

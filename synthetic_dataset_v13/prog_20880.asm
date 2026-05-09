; DESCRIPTION: Renders a blue line between points (208, 235) and (118, 134).
; PLAN: r0=208(x1), r1=235(y1), r2=118(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 235
LDI r2, 118
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

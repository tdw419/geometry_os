; DESCRIPTION: Renders a blue line between points (251, 235) and (508, 230).
; PLAN: r0=251(x1), r1=235(y1), r2=508(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 235
LDI r2, 508
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (238, 33) and (411, 235).
; PLAN: r0=238(x1), r1=33(y1), r2=411(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 33
LDI r2, 411
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (308, 235) and (65, 246).
; PLAN: r0=308(x1), r1=235(y1), r2=65(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 235
LDI r2, 65
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (158, 235) to (0, 133).
; PLAN: r0=158(x1), r1=235(y1), r2=0(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 235
LDI r2, 0
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (14, 133) and (143, 140).
; PLAN: r0=14(x1), r1=133(y1), r2=143(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 133
LDI r2, 143
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

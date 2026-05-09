; DESCRIPTION: Renders a purple line between points (143, 183) and (221, 85).
; PLAN: r0=143(x1), r1=183(y1), r2=221(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 183
LDI r2, 221
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

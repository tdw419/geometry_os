; DESCRIPTION: Renders a purple line between points (179, 199) and (279, 179).
; PLAN: r0=179(x1), r1=199(y1), r2=279(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 199
LDI r2, 279
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

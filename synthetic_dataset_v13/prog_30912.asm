; DESCRIPTION: Renders a purple line between points (315, 167) and (176, 106).
; PLAN: r0=315(x1), r1=167(y1), r2=176(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 167
LDI r2, 176
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

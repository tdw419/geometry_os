; DESCRIPTION: Renders a purple line between points (358, 166) and (208, 106).
; PLAN: r0=358(x1), r1=166(y1), r2=208(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 166
LDI r2, 208
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (182, 15) and (31, 169).
; PLAN: r0=182(x1), r1=15(y1), r2=31(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 15
LDI r2, 31
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

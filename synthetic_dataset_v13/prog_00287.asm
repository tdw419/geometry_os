; DESCRIPTION: Renders a purple line between points (144, 182) and (216, 38).
; PLAN: r0=144(x1), r1=182(y1), r2=216(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 182
LDI r2, 216
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (314, 199) and (330, 139).
; PLAN: r0=314(x1), r1=199(y1), r2=330(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 199
LDI r2, 330
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

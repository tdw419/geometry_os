; DESCRIPTION: Renders a purple line between points (7, 84) and (137, 139).
; PLAN: r0=7(x1), r1=84(y1), r2=137(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 84
LDI r2, 137
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

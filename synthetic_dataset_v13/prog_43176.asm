; DESCRIPTION: Renders a purple line between points (385, 184) and (60, 139).
; PLAN: r0=385(x1), r1=184(y1), r2=60(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 184
LDI r2, 60
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (35, 139) and (383, 31).
; PLAN: r0=35(x1), r1=139(y1), r2=383(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 139
LDI r2, 383
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

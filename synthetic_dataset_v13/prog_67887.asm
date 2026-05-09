; DESCRIPTION: Renders a purple line between points (2, 255) and (202, 139).
; PLAN: r0=2(x1), r1=255(y1), r2=202(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 255
LDI r2, 202
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

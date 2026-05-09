; DESCRIPTION: Renders a blue line between points (131, 139) and (255, 211).
; PLAN: r0=131(x1), r1=139(y1), r2=255(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 139
LDI r2, 255
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

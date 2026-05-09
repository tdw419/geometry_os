; DESCRIPTION: Renders a blue line between points (436, 139) and (359, 249).
; PLAN: r0=436(x1), r1=139(y1), r2=359(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 139
LDI r2, 359
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (89, 139) to (136, 211).
; PLAN: r0=89(x1), r1=139(y1), r2=136(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 136
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

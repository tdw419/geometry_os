; DESCRIPTION: Renders a blue line between points (351, 217) and (291, 139).
; PLAN: r0=351(x1), r1=217(y1), r2=291(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 217
LDI r2, 291
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

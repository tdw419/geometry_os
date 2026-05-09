; DESCRIPTION: Renders a blue line between points (351, 255) and (467, 114).
; PLAN: r0=351(x1), r1=255(y1), r2=467(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 255
LDI r2, 467
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

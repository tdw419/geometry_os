; DESCRIPTION: Renders a white line between points (351, 139) and (84, 121).
; PLAN: r0=351(x1), r1=139(y1), r2=84(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 139
LDI r2, 84
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

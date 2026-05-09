; DESCRIPTION: Renders a purple line between points (501, 119) and (89, 16).
; PLAN: r0=501(x1), r1=119(y1), r2=89(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 119
LDI r2, 89
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

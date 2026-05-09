; DESCRIPTION: Renders a blue line between points (467, 156) and (501, 62).
; PLAN: r0=467(x1), r1=156(y1), r2=501(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 156
LDI r2, 501
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

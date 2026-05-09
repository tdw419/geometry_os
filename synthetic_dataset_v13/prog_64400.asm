; DESCRIPTION: Renders a blue line between points (83, 255) and (477, 156).
; PLAN: r0=83(x1), r1=255(y1), r2=477(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 255
LDI r2, 477
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

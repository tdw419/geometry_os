; DESCRIPTION: Renders a blue line between points (143, 169) and (376, 21).
; PLAN: r0=143(x1), r1=169(y1), r2=376(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 169
LDI r2, 376
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

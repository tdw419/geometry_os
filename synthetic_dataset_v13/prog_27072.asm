; DESCRIPTION: Renders a blue line between points (139, 48) and (474, 140).
; PLAN: r0=139(x1), r1=48(y1), r2=474(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 48
LDI r2, 474
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

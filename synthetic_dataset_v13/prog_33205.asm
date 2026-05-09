; DESCRIPTION: Renders a blue line between points (318, 212) and (322, 11).
; PLAN: r0=318(x1), r1=212(y1), r2=322(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 212
LDI r2, 322
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

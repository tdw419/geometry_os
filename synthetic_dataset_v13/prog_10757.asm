; DESCRIPTION: Renders a blue line between points (244, 206) and (322, 31).
; PLAN: r0=244(x1), r1=206(y1), r2=322(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 206
LDI r2, 322
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

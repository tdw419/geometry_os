; DESCRIPTION: Places a blue line segment connecting (322, 65) to (211, 139).
; PLAN: r0=322(x1), r1=65(y1), r2=211(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 65
LDI r2, 211
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

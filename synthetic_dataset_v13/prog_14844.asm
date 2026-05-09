; DESCRIPTION: Places a green line segment connecting (322, 145) to (93, 206).
; PLAN: r0=322(x1), r1=145(y1), r2=93(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 145
LDI r2, 93
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (477, 118) and (322, 191).
; PLAN: r0=477(x1), r1=118(y1), r2=322(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 118
LDI r2, 322
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

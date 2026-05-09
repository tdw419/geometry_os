; DESCRIPTION: Renders a yellow line between points (322, 232) and (48, 157).
; PLAN: r0=322(x1), r1=232(y1), r2=48(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 232
LDI r2, 48
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

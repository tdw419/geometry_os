; DESCRIPTION: Renders a yellow line between points (384, 217) and (322, 148).
; PLAN: r0=384(x1), r1=217(y1), r2=322(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 217
LDI r2, 322
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

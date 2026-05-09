; DESCRIPTION: Renders a yellow line between points (471, 135) and (322, 118).
; PLAN: r0=471(x1), r1=135(y1), r2=322(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 135
LDI r2, 322
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

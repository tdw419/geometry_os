; DESCRIPTION: Renders a yellow line between points (322, 177) and (5, 97).
; PLAN: r0=322(x1), r1=177(y1), r2=5(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 177
LDI r2, 5
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

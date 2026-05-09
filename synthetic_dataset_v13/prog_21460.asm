; DESCRIPTION: Renders a yellow line between points (199, 114) and (373, 133).
; PLAN: r0=199(x1), r1=114(y1), r2=373(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 114
LDI r2, 373
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

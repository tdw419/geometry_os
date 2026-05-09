; DESCRIPTION: Renders a purple line between points (506, 139) and (372, 133).
; PLAN: r0=506(x1), r1=139(y1), r2=372(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 139
LDI r2, 372
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

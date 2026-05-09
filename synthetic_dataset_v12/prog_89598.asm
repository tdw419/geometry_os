; DESCRIPTION: Renders a purple line between points (165, 124) and (238, 144).
; PLAN: r0=165(x1), r1=124(y1), r2=238(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 124
LDI r2, 238
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

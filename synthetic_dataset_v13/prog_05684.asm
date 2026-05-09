; DESCRIPTION: Renders a purple line between points (372, 24) and (177, 245).
; PLAN: r0=372(x1), r1=24(y1), r2=177(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 24
LDI r2, 177
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

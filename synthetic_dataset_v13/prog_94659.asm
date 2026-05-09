; DESCRIPTION: Renders a purple line between points (337, 190) and (24, 227).
; PLAN: r0=337(x1), r1=190(y1), r2=24(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 190
LDI r2, 24
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

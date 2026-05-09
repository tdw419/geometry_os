; DESCRIPTION: Renders a purple line between points (8, 207) and (384, 133).
; PLAN: r0=8(x1), r1=207(y1), r2=384(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 207
LDI r2, 384
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (296, 1) and (417, 133).
; PLAN: r0=296(x1), r1=1(y1), r2=417(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 1
LDI r2, 417
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

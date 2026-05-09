; DESCRIPTION: Renders a purple line between points (414, 82) and (353, 230).
; PLAN: r0=414(x1), r1=82(y1), r2=353(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 82
LDI r2, 353
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

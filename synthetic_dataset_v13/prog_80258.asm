; DESCRIPTION: Renders a purple line between points (382, 82) and (341, 159).
; PLAN: r0=382(x1), r1=82(y1), r2=341(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 82
LDI r2, 341
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

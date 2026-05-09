; DESCRIPTION: Renders a purple line between points (341, 154) and (351, 212).
; PLAN: r0=341(x1), r1=154(y1), r2=351(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 154
LDI r2, 351
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

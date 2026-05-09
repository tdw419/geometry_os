; DESCRIPTION: Renders a purple line between points (341, 159) and (403, 52).
; PLAN: r0=341(x1), r1=159(y1), r2=403(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 159
LDI r2, 403
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

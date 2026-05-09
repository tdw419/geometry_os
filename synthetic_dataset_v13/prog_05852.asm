; DESCRIPTION: Renders a purple line between points (341, 221) and (26, 66).
; PLAN: r0=341(x1), r1=221(y1), r2=26(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 221
LDI r2, 26
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

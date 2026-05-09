; DESCRIPTION: Renders a purple line between points (170, 212) and (157, 245).
; PLAN: r0=170(x1), r1=212(y1), r2=157(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 212
LDI r2, 157
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

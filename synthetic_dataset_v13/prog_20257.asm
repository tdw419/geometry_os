; DESCRIPTION: Renders a purple line between points (4, 245) and (457, 71).
; PLAN: r0=4(x1), r1=245(y1), r2=457(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 245
LDI r2, 457
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

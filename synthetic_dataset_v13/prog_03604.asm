; DESCRIPTION: Renders a purple line between points (211, 135) and (264, 245).
; PLAN: r0=211(x1), r1=135(y1), r2=264(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 135
LDI r2, 264
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

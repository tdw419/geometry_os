; DESCRIPTION: Renders a purple line between points (264, 11) and (140, 92).
; PLAN: r0=264(x1), r1=11(y1), r2=140(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 11
LDI r2, 140
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

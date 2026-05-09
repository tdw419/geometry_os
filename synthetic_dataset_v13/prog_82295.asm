; DESCRIPTION: Renders a purple line between points (88, 225) and (31, 102).
; PLAN: r0=88(x1), r1=225(y1), r2=31(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 225
LDI r2, 31
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

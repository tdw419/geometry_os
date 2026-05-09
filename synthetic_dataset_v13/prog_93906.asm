; DESCRIPTION: Renders a purple line between points (489, 58) and (88, 19).
; PLAN: r0=489(x1), r1=58(y1), r2=88(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 58
LDI r2, 88
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

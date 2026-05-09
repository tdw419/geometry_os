; DESCRIPTION: Renders a black line between points (314, 112) and (67, 212).
; PLAN: r0=314(x1), r1=112(y1), r2=67(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 112
LDI r2, 67
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

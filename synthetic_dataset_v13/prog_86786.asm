; DESCRIPTION: Renders a purple line between points (43, 76) and (92, 206).
; PLAN: r0=43(x1), r1=76(y1), r2=92(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 76
LDI r2, 92
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

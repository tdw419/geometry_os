; DESCRIPTION: Renders a purple line between points (40, 148) and (247, 58).
; PLAN: r0=40(x1), r1=148(y1), r2=247(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 148
LDI r2, 247
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (10, 49) and (391, 92).
; PLAN: r0=10(x1), r1=49(y1), r2=391(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 49
LDI r2, 391
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

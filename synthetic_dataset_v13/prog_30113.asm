; DESCRIPTION: Renders a purple line between points (45, 44) and (47, 88).
; PLAN: r0=45(x1), r1=44(y1), r2=47(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 44
LDI r2, 47
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

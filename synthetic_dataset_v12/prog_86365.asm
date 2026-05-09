; DESCRIPTION: Renders a purple line between points (69, 7) and (78, 11).
; PLAN: r0=69(x1), r1=7(y1), r2=78(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 7
LDI r2, 78
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

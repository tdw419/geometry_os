; DESCRIPTION: Renders a purple line between points (118, 185) and (495, 252).
; PLAN: r0=118(x1), r1=185(y1), r2=495(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 185
LDI r2, 495
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

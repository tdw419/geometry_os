; DESCRIPTION: Renders a purple line between points (116, 185) and (7, 248).
; PLAN: r0=116(x1), r1=185(y1), r2=7(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 185
LDI r2, 7
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

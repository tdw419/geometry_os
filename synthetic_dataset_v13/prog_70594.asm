; DESCRIPTION: Renders a purple line between points (292, 116) and (88, 104).
; PLAN: r0=292(x1), r1=116(y1), r2=88(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 116
LDI r2, 88
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

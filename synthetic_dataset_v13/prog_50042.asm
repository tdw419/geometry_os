; DESCRIPTION: Renders a purple line between points (21, 252) and (88, 5).
; PLAN: r0=21(x1), r1=252(y1), r2=88(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 252
LDI r2, 88
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

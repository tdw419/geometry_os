; DESCRIPTION: Renders a purple line between points (14, 172) and (427, 36).
; PLAN: r0=14(x1), r1=172(y1), r2=427(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 172
LDI r2, 427
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

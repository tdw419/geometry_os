; DESCRIPTION: Renders a purple line between points (332, 103) and (427, 217).
; PLAN: r0=332(x1), r1=103(y1), r2=427(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 103
LDI r2, 427
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

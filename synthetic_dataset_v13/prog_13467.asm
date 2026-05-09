; DESCRIPTION: Renders a purple line between points (316, 232) and (466, 249).
; PLAN: r0=316(x1), r1=232(y1), r2=466(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 232
LDI r2, 466
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

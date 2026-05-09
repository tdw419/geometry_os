; DESCRIPTION: Renders a purple line between points (316, 209) and (264, 147).
; PLAN: r0=316(x1), r1=209(y1), r2=264(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 209
LDI r2, 264
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

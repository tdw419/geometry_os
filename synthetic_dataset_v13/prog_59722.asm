; DESCRIPTION: Renders a purple line between points (63, 13) and (316, 71).
; PLAN: r0=63(x1), r1=13(y1), r2=316(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 316
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

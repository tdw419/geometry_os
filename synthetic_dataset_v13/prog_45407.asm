; DESCRIPTION: Renders a purple line between points (290, 234) and (316, 217).
; PLAN: r0=290(x1), r1=234(y1), r2=316(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 234
LDI r2, 316
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

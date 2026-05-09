; DESCRIPTION: Renders a purple line between points (483, 248) and (316, 83).
; PLAN: r0=483(x1), r1=248(y1), r2=316(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 248
LDI r2, 316
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

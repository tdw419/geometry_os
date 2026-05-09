; DESCRIPTION: Renders a yellow line between points (316, 141) and (318, 39).
; PLAN: r0=316(x1), r1=141(y1), r2=318(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 141
LDI r2, 318
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

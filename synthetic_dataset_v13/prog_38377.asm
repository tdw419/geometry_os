; DESCRIPTION: Renders a purple line between points (316, 245) and (127, 223).
; PLAN: r0=316(x1), r1=245(y1), r2=127(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 245
LDI r2, 127
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

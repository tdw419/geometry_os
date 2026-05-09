; DESCRIPTION: Renders a magenta line between points (373, 200) and (316, 66).
; PLAN: r0=373(x1), r1=200(y1), r2=316(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 200
LDI r2, 316
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

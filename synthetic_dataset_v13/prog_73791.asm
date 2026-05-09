; DESCRIPTION: Renders a magenta line between points (316, 146) and (407, 201).
; PLAN: r0=316(x1), r1=146(y1), r2=407(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 146
LDI r2, 407
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

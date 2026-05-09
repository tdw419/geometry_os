; DESCRIPTION: Renders a magenta line between points (316, 137) and (381, 186).
; PLAN: r0=316(x1), r1=137(y1), r2=381(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 137
LDI r2, 381
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

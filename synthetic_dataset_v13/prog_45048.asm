; DESCRIPTION: Renders a magenta line between points (236, 246) and (316, 135).
; PLAN: r0=236(x1), r1=246(y1), r2=316(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 246
LDI r2, 316
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

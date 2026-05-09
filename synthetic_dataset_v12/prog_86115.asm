; DESCRIPTION: Places a magenta line segment connecting (316, 7) to (282, 114).
; PLAN: r0=316(x1), r1=7(y1), r2=282(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 7
LDI r2, 282
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

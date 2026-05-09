; DESCRIPTION: Draws a magenta line from (496, 26) to (316, 35).
; PLAN: r0=496(x1), r1=26(y1), r2=316(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 26
LDI r2, 316
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

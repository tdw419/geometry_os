; DESCRIPTION: Draws a magenta line from (316, 87) to (58, 166).
; PLAN: r0=316(x1), r1=87(y1), r2=58(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 87
LDI r2, 58
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

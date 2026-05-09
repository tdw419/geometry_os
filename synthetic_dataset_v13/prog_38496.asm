; DESCRIPTION: Draws a magenta line from (316, 250) to (492, 15).
; PLAN: r0=316(x1), r1=250(y1), r2=492(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 250
LDI r2, 492
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

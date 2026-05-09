; DESCRIPTION: Draws a magenta line from (348, 114) to (268, 56).
; PLAN: r0=348(x1), r1=114(y1), r2=268(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 114
LDI r2, 268
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

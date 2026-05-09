; DESCRIPTION: Draws a magenta line from (312, 188) to (375, 246).
; PLAN: r0=312(x1), r1=188(y1), r2=375(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 188
LDI r2, 375
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

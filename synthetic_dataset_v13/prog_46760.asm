; DESCRIPTION: Draws a magenta line from (123, 72) to (276, 230).
; PLAN: r0=123(x1), r1=72(y1), r2=276(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 72
LDI r2, 276
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

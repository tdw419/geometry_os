; DESCRIPTION: Draws a magenta line from (424, 91) to (246, 96).
; PLAN: r0=424(x1), r1=91(y1), r2=246(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 91
LDI r2, 246
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (454, 156) to (73, 54).
; PLAN: r0=454(x1), r1=156(y1), r2=73(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 156
LDI r2, 73
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

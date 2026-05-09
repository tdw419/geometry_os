; DESCRIPTION: Draws a magenta line from (181, 106) to (163, 199).
; PLAN: r0=181(x1), r1=106(y1), r2=163(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 106
LDI r2, 163
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

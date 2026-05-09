; DESCRIPTION: Draws a magenta line from (195, 106) to (369, 165).
; PLAN: r0=195(x1), r1=106(y1), r2=369(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 106
LDI r2, 369
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (183, 77) to (311, 248).
; PLAN: r0=183(x1), r1=77(y1), r2=311(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 77
LDI r2, 311
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (93, 183) to (302, 241).
; PLAN: r0=93(x1), r1=183(y1), r2=302(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 183
LDI r2, 302
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

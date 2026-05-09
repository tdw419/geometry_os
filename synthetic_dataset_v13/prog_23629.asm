; DESCRIPTION: Draws a magenta line from (140, 112) to (68, 102).
; PLAN: r0=140(x1), r1=112(y1), r2=68(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 112
LDI r2, 68
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

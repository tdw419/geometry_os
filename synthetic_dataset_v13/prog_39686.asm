; DESCRIPTION: Draws a magenta line from (311, 57) to (357, 6).
; PLAN: r0=311(x1), r1=57(y1), r2=357(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 57
LDI r2, 357
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

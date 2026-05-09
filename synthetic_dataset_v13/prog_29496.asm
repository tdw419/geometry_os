; DESCRIPTION: Draws a magenta line from (408, 45) to (357, 106).
; PLAN: r0=408(x1), r1=45(y1), r2=357(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 45
LDI r2, 357
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

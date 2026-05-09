; DESCRIPTION: Draws a magenta line from (357, 167) to (308, 168).
; PLAN: r0=357(x1), r1=167(y1), r2=308(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 167
LDI r2, 308
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

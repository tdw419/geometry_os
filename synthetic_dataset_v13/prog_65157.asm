; DESCRIPTION: Draws a magenta line from (3, 68) to (212, 11).
; PLAN: r0=3(x1), r1=68(y1), r2=212(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 68
LDI r2, 212
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

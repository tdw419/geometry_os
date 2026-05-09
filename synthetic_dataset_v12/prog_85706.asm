; DESCRIPTION: Draws a magenta line from (212, 232) to (307, 141).
; PLAN: r0=212(x1), r1=232(y1), r2=307(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 232
LDI r2, 307
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

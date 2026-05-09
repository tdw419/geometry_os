; DESCRIPTION: Draws a magenta line from (497, 50) to (73, 163).
; PLAN: r0=497(x1), r1=50(y1), r2=73(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 50
LDI r2, 73
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

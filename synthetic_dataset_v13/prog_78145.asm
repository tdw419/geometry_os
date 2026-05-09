; DESCRIPTION: Draws a magenta line from (212, 194) to (448, 49).
; PLAN: r0=212(x1), r1=194(y1), r2=448(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 194
LDI r2, 448
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

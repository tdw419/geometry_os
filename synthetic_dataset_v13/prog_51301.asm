; DESCRIPTION: Draws a magenta line from (343, 181) to (30, 199).
; PLAN: r0=343(x1), r1=181(y1), r2=30(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 181
LDI r2, 30
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

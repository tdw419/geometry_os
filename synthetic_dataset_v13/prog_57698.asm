; DESCRIPTION: Draws a magenta line from (177, 6) to (429, 0).
; PLAN: r0=177(x1), r1=6(y1), r2=429(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 6
LDI r2, 429
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

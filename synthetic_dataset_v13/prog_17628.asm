; DESCRIPTION: Draws a magenta line from (6, 199) to (449, 191).
; PLAN: r0=6(x1), r1=199(y1), r2=449(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 199
LDI r2, 449
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

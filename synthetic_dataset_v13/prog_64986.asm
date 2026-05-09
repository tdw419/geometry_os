; DESCRIPTION: Draws a magenta line from (94, 5) to (89, 194).
; PLAN: r0=94(x1), r1=5(y1), r2=89(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 5
LDI r2, 89
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

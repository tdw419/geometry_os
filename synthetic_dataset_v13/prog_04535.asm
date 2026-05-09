; DESCRIPTION: Draws a magenta line from (2, 199) to (118, 127).
; PLAN: r0=2(x1), r1=199(y1), r2=118(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 199
LDI r2, 118
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

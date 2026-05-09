; DESCRIPTION: Draws a magenta line from (132, 156) to (377, 107).
; PLAN: r0=132(x1), r1=156(y1), r2=377(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 156
LDI r2, 377
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

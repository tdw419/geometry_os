; DESCRIPTION: Draws a magenta line from (99, 4) to (358, 10).
; PLAN: r0=99(x1), r1=4(y1), r2=358(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 4
LDI r2, 358
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

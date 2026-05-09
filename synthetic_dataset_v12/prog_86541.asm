; DESCRIPTION: Draws a magenta line from (100, 198) to (86, 140).
; PLAN: r0=100(x1), r1=198(y1), r2=86(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 198
LDI r2, 86
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

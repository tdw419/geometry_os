; DESCRIPTION: Draws a magenta line from (453, 181) to (345, 232).
; PLAN: r0=453(x1), r1=181(y1), r2=345(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 181
LDI r2, 345
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

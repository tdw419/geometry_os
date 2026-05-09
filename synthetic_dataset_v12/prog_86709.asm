; DESCRIPTION: Draws a magenta line from (431, 142) to (136, 6).
; PLAN: r0=431(x1), r1=142(y1), r2=136(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 142
LDI r2, 136
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

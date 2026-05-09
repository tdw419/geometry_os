; DESCRIPTION: Draws a magenta line from (130, 84) to (265, 217).
; PLAN: r0=130(x1), r1=84(y1), r2=265(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 84
LDI r2, 265
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

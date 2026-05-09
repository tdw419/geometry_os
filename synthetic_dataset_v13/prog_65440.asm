; DESCRIPTION: Draws a magenta line from (136, 66) to (420, 199).
; PLAN: r0=136(x1), r1=66(y1), r2=420(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 66
LDI r2, 420
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

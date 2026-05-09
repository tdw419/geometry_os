; DESCRIPTION: Draws a magenta line from (136, 18) to (144, 47).
; PLAN: r0=136(x1), r1=18(y1), r2=144(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 18
LDI r2, 144
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

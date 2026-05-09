; DESCRIPTION: Draws a magenta line from (47, 106) to (56, 129).
; PLAN: r0=47(x1), r1=106(y1), r2=56(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 106
LDI r2, 56
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

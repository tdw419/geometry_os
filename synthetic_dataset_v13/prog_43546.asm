; DESCRIPTION: Draws a magenta line from (190, 181) to (83, 8).
; PLAN: r0=190(x1), r1=181(y1), r2=83(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 181
LDI r2, 83
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

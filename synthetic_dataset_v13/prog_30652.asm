; DESCRIPTION: Draws a magenta line from (145, 97) to (34, 80).
; PLAN: r0=145(x1), r1=97(y1), r2=34(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 97
LDI r2, 34
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

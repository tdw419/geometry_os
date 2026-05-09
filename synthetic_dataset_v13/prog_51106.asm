; DESCRIPTION: Draws a magenta line from (501, 25) to (112, 10).
; PLAN: r0=501(x1), r1=25(y1), r2=112(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 25
LDI r2, 112
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

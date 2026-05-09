; DESCRIPTION: Draws a magenta line from (157, 26) to (227, 5).
; PLAN: r0=157(x1), r1=26(y1), r2=227(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 26
LDI r2, 227
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

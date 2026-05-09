; DESCRIPTION: Draws a magenta line from (444, 155) to (423, 61).
; PLAN: r0=444(x1), r1=155(y1), r2=423(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 155
LDI r2, 423
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

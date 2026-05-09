; DESCRIPTION: Draws a magenta line from (471, 96) to (457, 90).
; PLAN: r0=471(x1), r1=96(y1), r2=457(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 96
LDI r2, 457
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

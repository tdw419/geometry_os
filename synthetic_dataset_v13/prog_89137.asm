; DESCRIPTION: Draws a magenta line from (181, 52) to (94, 162).
; PLAN: r0=181(x1), r1=52(y1), r2=94(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 52
LDI r2, 94
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

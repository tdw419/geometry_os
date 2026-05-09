; DESCRIPTION: Draws a magenta line from (9, 19) to (188, 99).
; PLAN: r0=9(x1), r1=19(y1), r2=188(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 19
LDI r2, 188
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

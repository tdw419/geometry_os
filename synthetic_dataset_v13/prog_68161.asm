; DESCRIPTION: Draws a magenta line from (431, 1) to (337, 9).
; PLAN: r0=431(x1), r1=1(y1), r2=337(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 1
LDI r2, 337
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

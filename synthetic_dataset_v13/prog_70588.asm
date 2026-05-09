; DESCRIPTION: Draws a magenta line from (337, 232) to (150, 149).
; PLAN: r0=337(x1), r1=232(y1), r2=150(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 232
LDI r2, 150
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

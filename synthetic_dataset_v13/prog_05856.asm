; DESCRIPTION: Draws a magenta line from (465, 232) to (175, 1).
; PLAN: r0=465(x1), r1=232(y1), r2=175(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 232
LDI r2, 175
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

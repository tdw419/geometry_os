; DESCRIPTION: Draws a magenta line from (63, 217) to (286, 25).
; PLAN: r0=63(x1), r1=217(y1), r2=286(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 217
LDI r2, 286
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

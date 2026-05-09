; DESCRIPTION: Draws a magenta line from (217, 79) to (359, 6).
; PLAN: r0=217(x1), r1=79(y1), r2=359(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 79
LDI r2, 359
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

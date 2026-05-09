; DESCRIPTION: Draws a magenta line from (454, 55) to (109, 90).
; PLAN: r0=454(x1), r1=55(y1), r2=109(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 55
LDI r2, 109
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

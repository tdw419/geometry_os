; DESCRIPTION: Draws a magenta line from (176, 77) to (454, 26).
; PLAN: r0=176(x1), r1=77(y1), r2=454(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 77
LDI r2, 454
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (315, 225) to (99, 133).
; PLAN: r0=315(x1), r1=225(y1), r2=99(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 225
LDI r2, 99
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

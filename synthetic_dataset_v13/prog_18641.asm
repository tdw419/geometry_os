; DESCRIPTION: Draws a magenta line from (59, 100) to (140, 153).
; PLAN: r0=59(x1), r1=100(y1), r2=140(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 100
LDI r2, 140
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

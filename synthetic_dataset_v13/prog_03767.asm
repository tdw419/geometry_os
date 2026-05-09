; DESCRIPTION: Draws a blue line from (0, 156) to (61, 153).
; PLAN: r0=0(x1), r1=156(y1), r2=61(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 156
LDI r2, 61
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

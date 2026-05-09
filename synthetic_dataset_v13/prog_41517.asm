; DESCRIPTION: Draws a magenta line from (34, 92) to (244, 11).
; PLAN: r0=34(x1), r1=92(y1), r2=244(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 92
LDI r2, 244
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

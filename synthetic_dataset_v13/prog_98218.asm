; DESCRIPTION: Draws a magenta line from (437, 92) to (142, 31).
; PLAN: r0=437(x1), r1=92(y1), r2=142(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 92
LDI r2, 142
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

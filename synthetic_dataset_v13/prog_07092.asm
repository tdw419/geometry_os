; DESCRIPTION: Draws a magenta line from (389, 11) to (389, 96).
; PLAN: r0=389(x1), r1=11(y1), r2=389(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 11
LDI r2, 389
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

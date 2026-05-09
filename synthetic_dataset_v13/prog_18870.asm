; DESCRIPTION: Draws a magenta line from (163, 11) to (20, 72).
; PLAN: r0=163(x1), r1=11(y1), r2=20(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 11
LDI r2, 20
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

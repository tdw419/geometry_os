; DESCRIPTION: Draws a magenta line from (163, 40) to (481, 112).
; PLAN: r0=163(x1), r1=40(y1), r2=481(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 40
LDI r2, 481
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

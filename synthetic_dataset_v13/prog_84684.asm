; DESCRIPTION: Draws a magenta line from (292, 51) to (163, 64).
; PLAN: r0=292(x1), r1=51(y1), r2=163(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 51
LDI r2, 163
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (453, 5) to (447, 238).
; PLAN: r0=453(x1), r1=5(y1), r2=447(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 5
LDI r2, 447
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

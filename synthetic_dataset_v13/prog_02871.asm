; DESCRIPTION: Draws a magenta line from (285, 51) to (144, 22).
; PLAN: r0=285(x1), r1=51(y1), r2=144(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 51
LDI r2, 144
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

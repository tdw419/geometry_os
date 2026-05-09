; DESCRIPTION: Draws a magenta line from (440, 138) to (92, 97).
; PLAN: r0=440(x1), r1=138(y1), r2=92(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 138
LDI r2, 92
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

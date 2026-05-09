; DESCRIPTION: Draws a purple line from (357, 163) to (79, 209).
; PLAN: r0=357(x1), r1=163(y1), r2=79(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 163
LDI r2, 79
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (312, 163) to (13, 29).
; PLAN: r0=312(x1), r1=163(y1), r2=13(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 163
LDI r2, 13
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

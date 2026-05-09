; DESCRIPTION: Draws a magenta line from (321, 181) to (414, 75).
; PLAN: r0=321(x1), r1=181(y1), r2=414(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 181
LDI r2, 414
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (250, 77) to (189, 212).
; PLAN: r0=250(x1), r1=77(y1), r2=189(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 77
LDI r2, 189
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

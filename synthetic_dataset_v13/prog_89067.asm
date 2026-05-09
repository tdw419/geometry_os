; DESCRIPTION: Draws a magenta line from (81, 34) to (250, 77).
; PLAN: r0=81(x1), r1=34(y1), r2=250(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 34
LDI r2, 250
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

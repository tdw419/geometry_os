; DESCRIPTION: Draws a magenta line from (286, 156) to (151, 51).
; PLAN: r0=286(x1), r1=156(y1), r2=151(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 156
LDI r2, 151
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

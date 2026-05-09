; DESCRIPTION: Draws a magenta line from (343, 84) to (112, 76).
; PLAN: r0=343(x1), r1=84(y1), r2=112(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 84
LDI r2, 112
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

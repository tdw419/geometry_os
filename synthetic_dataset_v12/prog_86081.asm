; DESCRIPTION: Draws a magenta line from (343, 189) to (475, 102).
; PLAN: r0=343(x1), r1=189(y1), r2=475(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 189
LDI r2, 475
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

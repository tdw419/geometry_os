; DESCRIPTION: Draws a magenta line from (498, 148) to (138, 99).
; PLAN: r0=498(x1), r1=148(y1), r2=138(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 148
LDI r2, 138
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

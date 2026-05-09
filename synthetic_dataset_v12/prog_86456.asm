; DESCRIPTION: Draws a magenta line from (289, 153) to (270, 149).
; PLAN: r0=289(x1), r1=153(y1), r2=270(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 153
LDI r2, 270
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (455, 184) to (140, 9).
; PLAN: r0=455(x1), r1=184(y1), r2=140(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 184
LDI r2, 140
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

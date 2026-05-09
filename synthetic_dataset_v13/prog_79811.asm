; DESCRIPTION: Draws a magenta line from (254, 101) to (250, 158).
; PLAN: r0=254(x1), r1=101(y1), r2=250(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 101
LDI r2, 250
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

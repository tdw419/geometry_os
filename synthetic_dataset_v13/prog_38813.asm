; DESCRIPTION: Draws a blue line from (461, 166) to (36, 123).
; PLAN: r0=461(x1), r1=166(y1), r2=36(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 166
LDI r2, 36
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

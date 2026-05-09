; DESCRIPTION: Draws a magenta line from (461, 23) to (148, 69).
; PLAN: r0=461(x1), r1=23(y1), r2=148(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 23
LDI r2, 148
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

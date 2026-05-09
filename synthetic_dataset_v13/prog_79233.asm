; DESCRIPTION: Places a magenta line segment connecting (53, 181) to (339, 63).
; PLAN: r0=53(x1), r1=181(y1), r2=339(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 181
LDI r2, 339
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

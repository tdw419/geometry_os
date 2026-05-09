; DESCRIPTION: Places a magenta line segment connecting (49, 123) to (455, 142).
; PLAN: r0=49(x1), r1=123(y1), r2=455(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 123
LDI r2, 455
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

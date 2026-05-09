; DESCRIPTION: Places a magenta line segment connecting (455, 53) to (291, 4).
; PLAN: r0=455(x1), r1=53(y1), r2=291(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 53
LDI r2, 291
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

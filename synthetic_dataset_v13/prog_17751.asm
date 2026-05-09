; DESCRIPTION: Places a magenta line segment connecting (496, 84) to (455, 194).
; PLAN: r0=496(x1), r1=84(y1), r2=455(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 84
LDI r2, 455
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

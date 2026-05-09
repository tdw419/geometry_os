; DESCRIPTION: Places a magenta line segment connecting (455, 108) to (457, 51).
; PLAN: r0=455(x1), r1=108(y1), r2=457(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 108
LDI r2, 457
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

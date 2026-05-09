; DESCRIPTION: Places a magenta line segment connecting (288, 92) to (451, 148).
; PLAN: r0=288(x1), r1=92(y1), r2=451(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 92
LDI r2, 451
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (399, 136) to (301, 163).
; PLAN: r0=399(x1), r1=136(y1), r2=301(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 136
LDI r2, 301
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

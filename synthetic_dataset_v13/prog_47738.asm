; DESCRIPTION: Places a magenta line segment connecting (247, 108) to (389, 39).
; PLAN: r0=247(x1), r1=108(y1), r2=389(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 108
LDI r2, 389
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (127, 92) to (302, 145).
; PLAN: r0=127(x1), r1=92(y1), r2=302(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 92
LDI r2, 302
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

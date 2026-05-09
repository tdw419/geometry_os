; DESCRIPTION: Places a purple line segment connecting (302, 241) to (127, 151).
; PLAN: r0=302(x1), r1=241(y1), r2=127(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 241
LDI r2, 127
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

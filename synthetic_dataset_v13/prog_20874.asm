; DESCRIPTION: Places a purple line segment connecting (490, 82) to (127, 169).
; PLAN: r0=490(x1), r1=82(y1), r2=127(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 82
LDI r2, 127
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

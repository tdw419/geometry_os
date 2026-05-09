; DESCRIPTION: Places a magenta line segment connecting (322, 194) to (457, 106).
; PLAN: r0=322(x1), r1=194(y1), r2=457(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 194
LDI r2, 457
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (157, 199) to (101, 138).
; PLAN: r0=157(x1), r1=199(y1), r2=101(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 199
LDI r2, 101
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

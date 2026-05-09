; DESCRIPTION: Places a magenta line segment connecting (318, 19) to (195, 151).
; PLAN: r0=318(x1), r1=19(y1), r2=195(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 19
LDI r2, 195
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

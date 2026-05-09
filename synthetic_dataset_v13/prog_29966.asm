; DESCRIPTION: Places a magenta line segment connecting (145, 195) to (383, 90).
; PLAN: r0=145(x1), r1=195(y1), r2=383(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 195
LDI r2, 383
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

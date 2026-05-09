; DESCRIPTION: Places a purple line segment connecting (257, 178) to (145, 97).
; PLAN: r0=257(x1), r1=178(y1), r2=145(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 178
LDI r2, 145
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

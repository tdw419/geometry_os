; DESCRIPTION: Places a purple line segment connecting (257, 4) to (185, 115).
; PLAN: r0=257(x1), r1=4(y1), r2=185(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 4
LDI r2, 185
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

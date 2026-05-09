; DESCRIPTION: Places a purple line segment connecting (258, 195) to (496, 191).
; PLAN: r0=258(x1), r1=195(y1), r2=496(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 195
LDI r2, 496
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

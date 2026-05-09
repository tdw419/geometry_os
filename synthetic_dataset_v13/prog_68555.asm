; DESCRIPTION: Places a green line segment connecting (497, 191) to (455, 189).
; PLAN: r0=497(x1), r1=191(y1), r2=455(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 191
LDI r2, 455
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (166, 184) to (267, 23).
; PLAN: r0=166(x1), r1=184(y1), r2=267(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 184
LDI r2, 267
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

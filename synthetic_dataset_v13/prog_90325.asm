; DESCRIPTION: Places a purple line segment connecting (267, 140) to (221, 222).
; PLAN: r0=267(x1), r1=140(y1), r2=221(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 140
LDI r2, 221
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

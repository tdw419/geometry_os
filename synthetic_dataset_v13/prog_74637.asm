; DESCRIPTION: Places a blue line segment connecting (267, 211) to (447, 17).
; PLAN: r0=267(x1), r1=211(y1), r2=447(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 211
LDI r2, 447
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

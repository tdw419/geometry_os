; DESCRIPTION: Places a blue line segment connecting (267, 88) to (391, 196).
; PLAN: r0=267(x1), r1=88(y1), r2=391(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 88
LDI r2, 391
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (96, 113) to (497, 87).
; PLAN: r0=96(x1), r1=113(y1), r2=497(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 113
LDI r2, 497
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

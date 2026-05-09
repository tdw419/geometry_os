; DESCRIPTION: Places a magenta line segment connecting (372, 127) to (497, 135).
; PLAN: r0=372(x1), r1=127(y1), r2=497(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 127
LDI r2, 497
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

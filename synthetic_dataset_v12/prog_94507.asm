; DESCRIPTION: Places a magenta line segment connecting (497, 104) to (166, 133).
; PLAN: r0=497(x1), r1=104(y1), r2=166(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 104
LDI r2, 166
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

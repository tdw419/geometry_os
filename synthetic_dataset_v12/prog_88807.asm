; DESCRIPTION: Places a magenta line segment connecting (425, 246) to (497, 254).
; PLAN: r0=425(x1), r1=246(y1), r2=497(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 246
LDI r2, 497
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

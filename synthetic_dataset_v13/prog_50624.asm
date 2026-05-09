; DESCRIPTION: Places a purple line segment connecting (497, 174) to (272, 82).
; PLAN: r0=497(x1), r1=174(y1), r2=272(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 174
LDI r2, 272
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

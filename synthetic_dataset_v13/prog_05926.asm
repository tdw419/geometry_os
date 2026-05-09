; DESCRIPTION: Places a yellow line segment connecting (230, 244) to (497, 97).
; PLAN: r0=230(x1), r1=244(y1), r2=497(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 244
LDI r2, 497
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

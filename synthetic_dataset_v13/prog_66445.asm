; DESCRIPTION: Places a purple line segment connecting (286, 217) to (157, 60).
; PLAN: r0=286(x1), r1=217(y1), r2=157(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 217
LDI r2, 157
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

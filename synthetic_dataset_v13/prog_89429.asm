; DESCRIPTION: Places a purple line segment connecting (454, 251) to (263, 143).
; PLAN: r0=454(x1), r1=251(y1), r2=263(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 251
LDI r2, 263
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

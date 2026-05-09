; DESCRIPTION: Places a black line segment connecting (378, 137) to (429, 157).
; PLAN: r0=378(x1), r1=137(y1), r2=429(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 137
LDI r2, 429
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

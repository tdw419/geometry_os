; DESCRIPTION: Places a black line segment connecting (325, 178) to (429, 23).
; PLAN: r0=325(x1), r1=178(y1), r2=429(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 178
LDI r2, 429
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
